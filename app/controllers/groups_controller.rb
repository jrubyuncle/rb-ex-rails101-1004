class GroupsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    #flash[:notice] = "this-is-notice"
    @groups = Group.all
  end

  def show
    @group = Group.find params[:id]
    @posts = @group.posts
  end

  def new
    @group = Group.new
  end

  def create

    @group = current_user.groups.new group_params
    if @group.save
      current_user.join_group(@group)
      redirect_to groups_path
    else
      render :new
    end
  end

  def edit
    @group = current_user.groups.find params[:id]
  end

  def update
    @group = current_user.groups.find params[:id]

    if @group.update group_params
      redirect_to groups_path, notice: "group modified ok"
    else
      render :edit
    end
  end

  def destroy
    @group = current_user.groups.find params[:id]
    @group.destroy
    redirect_to groups_path, alert: "group deleted"
  end

  def join
    @group = current_user.groups.find params[:id]

    if current_user.is_member_of_group?(@group)
      flash[:warning] = "you are already member!"
    else
      current_user.join_group(@group)
      flash[:notice] = "join ok"
    end

    redirect_to group_path(@group)
  end

  def quit
    @group = current_user.groups.find params[:id]

    if current_user.is_member_of_group?(@group)
      current_user.quit_group(@group)
      flash[:alert] = "delete ok"
    else
      flash[:warning] = "you are not member"
    end

    redirect_to group_path(@group)
  end

  private
  def group_params
    params.require(:group).permit(:title, :description)
  end
end

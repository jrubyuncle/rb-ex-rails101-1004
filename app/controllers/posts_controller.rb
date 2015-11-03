class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_group
  before_action :member_required, only: [:new, :create]

  def new
    #@group = Group.find params[:group_id]
    @post = @group.posts.new
  end

  def create
    #@group = Group.find params[:group_id]
    @post = @group.posts.new post_params
    @post.author = current_user

    if @post.save
      redirect_to group_path(@group), notice: "post created ok"
    else
      render :new
    end
  end

  def edit
    #@group = Group.find params[:group_id]
    #@post = @group.posts.find params[:id]
    @post = current_user.posts.find params[:id]
  end

  def update
    #@group = Group.find params[:group_id]
    #@post = @group.posts.find params[:id]
    @post = current_user.posts.find params[:id]

    if @post.update post_params
      redirect_to group_path(@group), notice: "post updated ok"
    else
      render :edit
    end
  end

  def destroy
    #@group = Group.find params[:group_id]
    #@post = @group.posts.find params[:id]
    @post = current_user.posts.find params[:id]

    @post.destroy
    redirect_to group_path(@group), alert: "post deleted"
  end

  private
  def find_group
    @group = Group.find params[:group_id]
  end

  def post_params
    params.require(:post).permit(:content)
  end

  def member_required
    # @group.members    current_user
    # @group                  current_user.participated_groups
    if ! current_user.is_member_of_group?(@group)
      flash[:warning] = "you are not member"
      redirect_to group_path(@group)
    end
  end
end

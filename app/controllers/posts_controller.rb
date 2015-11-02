class PostsController < ApplicationController
  def new
    @group = Group.find params[:group_id]
    @post = @group.posts.new
  end

  def create
    @group = Group.find params[:group_id]
    @post = @group.posts.new post_params

    if @post.save
      redirect_to group_path(@group), notice: "post created ok"
    else
      render :new
    end
  end

  def edit
    @group = Group.find params[:group_id]
    @post = @group.posts.find params[:id]
  end

  def update
    @group = Group.find params[:group_id]
    @post = @group.posts.find params[:id]

    if @post.update post_params
      redirect_to group_path(@group), notice: "post updated ok"
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end

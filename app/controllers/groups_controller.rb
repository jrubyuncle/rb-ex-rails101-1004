class GroupsController < ApplicationController
  def index
    #flash[:notice] = "this-is-notice"
    @groups = Group.all
  end
end

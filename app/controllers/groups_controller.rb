class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update, :destroy]
  before_action :require_login

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    @group = current_user.groups.build(group_params)

    if @group.save
      redirect_to groups_path, notice: 'Group was successfully created.'
    else
      render :new
    end
  end

  def update
    if @group.update(group_params)
      redirect_to edit_group_path(@group), notice: 'Group was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_url, notice: 'Group was successfully destroyed.'
  end

  private
    def set_group
      @group = current_user.groups.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name, :user_id)
    end
end

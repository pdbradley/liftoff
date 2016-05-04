class MembersController < ApplicationController
  # #before_action :set_group, only: [:edit, :update, :destroy]
  # before_action :require_login

  def index
    @group = current_user.groups.find(params[:group_id])
  end

  def new
    @group = current_user.groups.find(params[:group_id])
    @member = @group.members.build
  end

  def create
    @group = current_user.groups.find(params[:group_id])
    @member = @group.members.build(member_params)
    if @member.save
      redirect_to group_members_path(group: @group), notice: 'Member was successfully created.'
    else
      render :new
    end
  end

  def edit
    @group = current_user.groups.find(params[:group_id])
    @member = @group.members.find(params[:id])
  end

  def update
    @group = current_user.groups.find(params[:group_id])
    @member = @group.members.find(params[:id])
    if @member.update(member_params)
      redirect_to group_members_path(group: @group), notice: 'Member was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @group = current_user.groups.find(params[:group_id])
    @member = @group.members.find(params[:id])
    @member.destroy
    redirect_to group_members_path(group: @group), notice: 'Member was successfully destroyed.'
  end


  private

    def member_params
      params.require(:member).permit(:last_name, :first_name, :phone_number, :group_id)
    end
end

  # def destroy
  #   @group.destroy
  #   redirect_to groups_url, notice: 'Group was successfully destroyed.'
  # end

  # private
  #   def set_group
  #     @group = current_user.groups.find(params[:id])
  #   end

  #   def group_params
  #     params.require(:group).permit(:name, :user_id)
  #   end
# end


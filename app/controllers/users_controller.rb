class UsersController < ApplicationController
end

def new
  @user = User.new
end
  
def create
  User.create(user_params)
end  

private

def user_params
  params.require(:user).permit(:nickname,:email,:password,:family_name,:first_name,:family_name_j,:first_name_j,:birth).merge(user_id: current_user.id)
end
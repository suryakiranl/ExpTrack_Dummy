class UsersController < ApplicationController
  def index
    @users = User.all

    # Return data in the expected output format
    # Current I would like to support only HTML web pages.
    respond_to do |format|
      format.html
    end
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html
    end
  end

  def create
    user_to_persist = params[:user]
    @user = User.new(user_to_persist)

    respond_to do |format|
      # If the user is saved successfully, go to list the users
      if @user.save
        format.html { redirect_to users_url,
                      notice: 'Your new User is added to the system.' }
      else
        # If there is an error when saving the user, may be due to validations,
        # go back to the new users page.
        format.html { render action: 'new'}
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      # If the update operation completes successfully, go to displaying list of users
      if @user.update_attributes(params[:user])
        format.html { redirect_to users_url,
                      notice: 'Your User information is updated successfully.' }
      else
        # If it fails during update, stay on the page and display errors.
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      # Go back to displaying the current user list when done with deleting the user.
      format.html { redirect_to users_url }
    end
  end
end

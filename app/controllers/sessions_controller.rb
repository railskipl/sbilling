class SessionsController < ApplicationController
    def new
    @title="Sign in"
  end
  def create

    if params[:device] == 'mobile' 

        user = User.authenticate(params[:username], params[:password])
        if user.nil?
          flash.now[:error] = "Invalid email/password combination."
          @title = "Sign in"
          render :status =>401,:json => { :error => "Invalid" } 
        else
         sign_in user
           @user = current_user.id
           
           render :status =>200,:json => @user.to_json
          
        end
    else
        user = User.authenticate(params[:session][:username], params[:session][:password])
        if user.nil?
        flash.now[:error] = "Invalid email/password combination."
        @title = "Sign in"
        render 'new'
        else
          sign_in user
          redirect_to root_path
         end
   end  
 end
 
  def destroy
    sign_out
    redirect_to root_path
  end

end

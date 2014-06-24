class UsersController < ApplicationController
    before_filter :authenticate, :only => [:edit, :update]
    before_filter :correct_user, :only => [:edit, :update]
  
  def show
    @user = User.find(params[:id])

  end
  
  def new
    @user = User.new
    @title="Sign up"
  end
  
  def dashboard
      @users = User.all
  end

 def create
   @user = User.new(params[:user])
   if @user.save 
     sign_in @user
    redirect_to user_root_path
  else
   @title = "Sign up"
   render 'new'
 end
 
end

  def edit

    @title = "Edit user"
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end
   def change_password

    @user = User.find(current_user.id)

    if request.post?
      if User.authenticate(@user.username, params[:change_password][:old_password])
          if ((params[:change_password][:new_password] == params[:change_password][:new_password_confirmation]) && !params[:change_password][:new_password_confirmation].blank?)
            @user.password = params[:change_password][:new_password]

              if @user.save!
                flash[:notice] = "Password successfully updated"
                redirect_to change_password_path
              else
                flash[:alert] = "Password not changed"
                render :action => 'change_password'
              end

            else
              flash[:alert] = "New Password Mismatch" 
              render :action => 'change_password'
            end
        else
            flash[:alert] = "Old Password Incorrect" 
            render :action => 'change_password'
        end
    end

   end


  def dtc
    @subzones = Reader.find_all_by_user_id(params[:id])
    values = Array.new
    @subzones.each do |subzone|
      values.push("user_id" => subzone.user_id, "sub_zone_id"=> subzone.sub_zone_id, "sub_zone_name"=> SubZone.find(subzone.sub_zone_id).name, "zone_id"=> subzone.zone_id, "zone_name" => Zone.find(subzone.zone_id).zone_name)
    end
    
    @subzones1 = Hash["allocated_subzones" => values]
    render :json => @subzones1 
  end
  

  def zone_json
    @zones = Zone.all
    @zones = Hash["zones" => @zones]
     render :json => @zones   
  end
  
  def sub_zone_json
    @sub_zones = SubZone.all
    @sub_zones = Hash["sub_zones" => @sub_zones]
     render :json => @sub_zones
  end
     
  private
  def authenticate
    deny_access unless signed_in?
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user=(@user)
  end

  
end

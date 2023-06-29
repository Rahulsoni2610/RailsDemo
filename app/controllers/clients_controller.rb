class ClientsController < ApplicationController
  def index
    
    unless cookies[:name].nil? 
      @client=cookies[:name]
      cookies.delete(:name)  
      flash[:notice] = "You have successfully logged in."
    else
      redirect_to login_path, alert: "You have successfully logged out."
    end

    # @client = Client.all
  end

  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new
  end

  def create 
    @client = Client.new(new_client)
    if @client.save 
      redirect_to login_path
    else
      flash[:notice] = "sorry"
      render action: "new"
    end
  end
  
  def login1
    name = params[:name]
    password = params[:password]
    if Client.find_by(name: name) && Client.find_by(password: password)
      cookies[:name] = name
      redirect_to controller: :clients,action: :index
    else
      redirect_to login_path
    end
  end
  def login

  end

  private
  def new_client
    params.require(:client).permit(:name,:password)
  end

end

class UsersController < ApplicationController
    use Rack::Flash

    get '/signup' do
        erb :'users/new'
    end

    post '/signup' do
        @user = User.new(params[:user])
        if @user.save
            session[:user_id] = @user.id
            redirect '/dreams'
        else
            erb :'users/new'
        end
    end

end
class DreamsController < ApplicationController

    use Rack::Flash

    # READ 1 - read a list of dreams
    get '/dreams' do
        # @dreams = Dream.all
        @dreams = current_user.dreams
        erb :'dreams/index'
    end

    # CREATE 1 - get a new dream form
    get '/dreams/new' do
        erb :'dreams/new'
    end

    # CREATE 2 - post the new dream form
    post '/dreams' do
        dream = current_user.dreams.build(params[:dream])
        # the above line is associated build. current_user is what you want to associate it to. creates a dream with a foreign key already filled out. this is the has_many version
        # the belongs_to would be @user = Dream.build_user() - would build user based on dreams
        if dream.save
            redirect '/dreams'
        else
            erb :'dreams/new'
        end
    end

    # UPDATE 1 - edits the dream
    get '/dreams/:id/edit' do
        set_dream
        #doesnt allow you to edit someone else's dream entry
        if current_user == @dream.user_id
            erb :'dreams/edit'
        else
            redirect '/dreams'
        end
    end

    # READ 2 - view more details about a dream
    get '/dreams/:id' do
        set_dream
        if set_dream
            erb :'dreams/show'
        else
            redirect '/dreams'
        end
        #params is a hash for accessing a key called id, which is given by our route variable
    end

    # UPDATE 2 - patch request to update the dream
    patch '/dreams/:id' do
        set_dream
        if current_user == @dream.user && @dream.update(
            title: params[:dream][:title],
            date: params[:dream][:date],
            genre: params[:dream][:genre],
            dream: params[:dream][:dream]
        )
        redirect "/dreams/#{@dream.id}"
        else
            erb :'dreams/edit'
        end
    end

    # DELETE
    delete '/dreams/:id' do
        set_dream
        if current_user == @dream.user
            @dream.destroy 
        end
        redirect '/dreams'
    end
    

    private
        def set_dream
            @dream = Dream.find_by_id(params[:id])
        end
        # id lives in params[:id]

end
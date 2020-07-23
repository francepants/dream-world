class DreamsController < ApplicationController

    use Rack::Flash

    get '/dreams' do
        @dreams = current_user.dreams
        erb :'dreams/index'
    end

    get '/dreams/new' do
        erb :'dreams/new'
    end

    post '/dreams' do
        dream = current_user.dreams.build(params[:dream])
        if dream.save
            redirect '/dreams'
        else
            erb :'dreams/new'
        end
    end

    get '/dreams/:id/edit' do
        set_dream
        if current_user == @dream.user
            erb :'dreams/edit'
        else
            redirect '/dreams'
        end
    end

    get '/dreams/:id' do
        set_dream
        if current_user == @dream.user
            erb :'dreams/show'
        else
            redirect '/dreams'
        end
        # if set_dream
        #     erb :'dreams/show'
        # else
        #     redirect '/dreams'
        # end
    end

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

end
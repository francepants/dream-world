class DreamsController < ApplicationController
    # READ 1
    get '/dreams' do
        # @dreams = Dream.all
        @dreams = current_user.dreams

        erb :'dreams/index'
    end

    # CREATE 1
    get '/dreams/new' do
        erb :'dreams/new'
    end

    # CREATE 2
    post '/dreams' do
        dream = current_user.dreams.build(params[:dream])
        if dream.save
            redirect '/dreams'
        else
            erb :'dreams/new'
        end
    end

    # UPDATE 1
    get '/dreams/:id/edit' do
        set_dream
        erb :'dreams/edit'
    end

    # READ 2
    get '/dreams/:id' do
        set_dream
        if set_dream
            erb :'dreams/show'
        else
            redirect '/dreams'
        end
        #params is a hash for accessing a key called id, which is given by our route variable
    end

    # UPDATE 2
    patch '/dreams/:id' do
        set_dream
        if @dream.update(
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
        @dream.destroy
        redirect '/dreams'
    end
    

    private
        def set_dream
            @dream = Dream.find_by_id(params[:id])
        end
        # id lives in params[:id]

end

# order the dreams by date entered? 
# use date:
# if false
#     @dreams = Dream.all
# else
#     @dreams = Dream.order(id: :desc)
# end
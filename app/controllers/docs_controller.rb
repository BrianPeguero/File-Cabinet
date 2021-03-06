class DocsController < ApplicationController
#allows it to run before other actions
    before_action :find_doc, only: [:show, :edit, :update, :destroy]

    def index
        #in order of created new to old
        #@docs = Doc.all(DECS)
        
        #after adding users this is how to only display current user
        @docs = Doc.where(user_id: current_user)
    end

    def show
    end

    def new
        @doc = current_user.docs.build
    end

    def create
        @doc = current_user.docs.build(doc_params)

        if @doc.save
            redirect_to @doc
        else
            render "new"
        end
    end

    def edit
        #responsible for the view file
        #taken cre of because it finds the params like show
    end

    def update
        #changes the parameters
        if @doc.update(doc_params)
            redirect_to @doc
        else
            render "edit"
        end
    end

    def destroy
        @doc.destroy
        redirect_to "index"
    end

    private
        def find_doc
            @doc = Doc.find(params[:id])
        end

        def doc_params
            params.require(:doc).permit(:title, :content)
        end
end

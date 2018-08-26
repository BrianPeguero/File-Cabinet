class DocsController < ApplicationController
#allows it to run before other actions
    before_action :find_doc, only: [:show, :edit, :update, :destroy]

    def index
        #in order of created new to old
        @doc = Doc.all.order("created_at DESC")
    end

    def show
    end

    def new
        @doc = Doc.new
    end

    def create
        @doc = Doc.new(doc_params)

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

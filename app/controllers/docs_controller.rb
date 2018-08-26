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
    end

    def update
    end

    def destroy
    end

    private
        def find_doc
            @doc = Doc.find(params[:id])
        end

        def doc_params
            params.require(:doc).permit(:title, :content)
        end
end

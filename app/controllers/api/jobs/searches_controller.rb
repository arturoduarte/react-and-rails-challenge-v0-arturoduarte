# frozen_string_literal: true

module API
  module Jobs
    class SearchesController < ActionController::API
      before_action :set_search, only: %i[show destroy]

      # GET /api/jobs/searches
      def index
        searches = Search.includes(:jobs).order(id: :desc)
        render json: ::SearchSerializer.new(searches)
      end

      # GET /api/jobs/searches/:id
      def show
        render json: ::SearchSerializer.new(@search)
      end

      # POST /api/jobs/searches?query=Rails
      def create
        search = Search.create!(query: params[:query])
        render json: ::SearchSerializer.new(search)
      end

      # DELETE /api/jobs/searches/:id
      def destroy
        @search.destroy!
        head :ok
      end

      private def set_search
        @search = Search.find(params[:id])
      end
    end
  end
end

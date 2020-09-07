# frozen_string_literal: true

module API
  module Jobs
    class FavoritesController < ActionController::API
      before_action :set_search, only: %i[show destroy]
      
      # GET /api/jobs/favorites

      
      #PUT /api/jobs/favorites/:id
      def update                        
        job = Job.find(params[:id])
        job.favorite = job.favorite ? false : true
        job.save                
      end
      
    end
  end
end

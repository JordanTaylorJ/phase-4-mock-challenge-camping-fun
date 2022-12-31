class CampersController < ApplicationController
    wrap_parameters format: []
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response 

    def index
        campers = Camper.all 
        render json: campers, status: :ok
    end
    
    def show
        camper = Camper.find(params[:id])
        render json: camper, status: :ok, serializer: CamperActivitiesSerializer
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end

    private
    def camper_params
        params.permit(:name, :age, :activities)
    end

    def render_not_found_response
        render json: {error: "Camper not found"}, status: :not_found 
    end

    def render_unprocessable_entity_response(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity 
    end
end

class AutobidsController < ApplicationController
  before_action :authenticate_request

  def create
    autobid = Autobid.new(autobid_params)
    if autobid.save
      render json: { message: 'autobid saved successfully' }, status: 200
    else
      render json: { message: 'Error autobid',
                     error: autobid.errors.full_messages }, status: 400
    end
  end

  def destroy
    autobid = Autobid.find(params[:id])
    if autobid.destroy
      render json: { message: 'autobid delete successfully' }, status: 200
    else
      render json: { message: 'Error autobid',
                     error: autobid.errors.full_messages }, status: 400
    end
  end

  private

  def autobid_params
    params.require(:autobid).permit(:user_id, :item_id, :alert).tap do |w|
      w[:user_id] = current_user.id
    end
  end
end

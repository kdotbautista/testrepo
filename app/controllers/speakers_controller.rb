class SpeakersController < ApplicationController
  before_filter :authenticate_user!

  # GET /speakers/1/edit
  def edit
    @speaker = current_user.speaker
  end

  # PUT /speakers/1
  # PUT /speakers/1.json
  def update
    @speaker = current_user.speaker

    if @speaker.update_attributes(params[:speaker])
      redirect_to cfps_path, notice: 'Speaker updated.'
    else
      render action: "edit"
    end
  end
end

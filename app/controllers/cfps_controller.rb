class CfpsController < ApplicationController
  before_filter :authenticate_user!

  # GET /cfps
  def index
    current_user.speaker.valid?
    @speaker = current_user.speaker
    if not notice.blank? then
      @notice = notice;
    end

    @proposals = @speaker.proposals;
  end

  def show
  end
end

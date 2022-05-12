class ProposalsController < ApplicationController
  # GET /proposals/new
  # GET /proposals/new.json
  def new
    @proposal = current_user.speaker.proposals.new
  end

  # GET /proposals/1/edit
  def edit
    @proposal = current_user.speaker.proposals.find(params[:id]);
  end

  # POST /proposals
  # POST /proposals.json
  def create
    @proposal = Proposal.new(params[:proposal])
    @proposal.speaker = current_user.speaker

    if @proposal.save
      redirect_to cfps_path, notice: 'Proposal submitted.'
    else
      render action: "new"
    end
  end

  # PUT /proposals/1
  # PUT /proposals/1.json
  def update
    @proposal = current_user.speaker.proposals.find(params[:id]);

    if @proposal.update_attributes(params[:proposal])
      redirect_to cfps_path, notice: 'Proposal updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /proposals/1
  # DELETE /proposals/1.json
  def destroy
    @proposal = current_user.speaker.proposals.find(params[:id]);
    if @proposal.destroy
      redirect_to cfps_path, notice: 'Proposal deleted.'
    else
      redirect_to cfps_path, alert: 'Something went wrong trying to delete the proposal. Please try again.'
    end
  end
end

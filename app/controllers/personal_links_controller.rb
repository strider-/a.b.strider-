class PersonalLinksController < ApplicationController
  before_filter :authenticated

  include ApplicationHelper

  def edit
    @links = PersonalLink.all
  end

  def create
    link = params[:link]
    respond_to do |format|
      new_link = PersonalLink.create(title: link[:title], link: link[:link], code: link[:code])
      if new_link.valid?
        format.json { render json: { success: true, id: new_link.id } }
      end

      format.json { render json: { success: false, error: "Unable to create link!" } }
    end
  end

  def update
    link = params[:link]
    respond_to do |format|
      if PersonalLink.find(link[:id]).update_attributes(link)
        format.json { render json: { success: true, id: link[:id] } }
      end

      format.json { render json: { success: false, error: "Unable to save changes!" } }
    end
  end

  def destroy
    PersonalLink.find(params[:link_id]).destroy
    respond_to do |format|
      format.json { render json: { success: true } }
    end
  end
end

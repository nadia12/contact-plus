class ContactsController < ApplicationController
  layout 'user'
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  authorize_resource
  
  def index
    @contacts = current_user.contacts.page(params[:page]).per(3)
  end

  def show
  end

  def new
    @contact = Contact.new
  end

  def edit
  end

  def create
    @contact = current_user.contacts.new(contact_params)


    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render action: 'show', status: :created, location: @contact }
      else
        format.html { render action: 'new' }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contact.deleted!
    respond_to do |format|
      format.html { redirect_to contacts_path }
      format.json { head :no_content }
    end
  end

 

  private

    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:name, :phone, :address, :email, :group_id, :deleted)
    end
end

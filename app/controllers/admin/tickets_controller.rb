class Admin::TicketsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_show, only: [:show, :edit, :update, :destroy]
  layout "admin"


  def check_ticket
  	@ticket_secret = params[:secret]
  	if @ticket_secret
  		@purchase = Purchase.includes(:tickets).where('purchases.secret' => @ticket_secret).first()
  		@tickets = @purchase.tickets if @purchase
  	else
  		@purchase = false
  	end
  	#@tickets = Ticket.join("purchases on tickets.purchase_id = purchases.id").where(secret: @ticket_secret)
  end

end

class OrdersController < ApplicationController

  post '/orders' do
    @order = Order.new(params[:order])
    @order.user = current_user
    @order.status = "waiting"
    @order.save

    redirect '/show'
  end

  post '/orders/:id/clean' do
    @order = Order.find(params[:id])
    @order.status = "cleaning"
    @order.machine = params[:machine]
    @order.save

    redirect 'show'
  end


end

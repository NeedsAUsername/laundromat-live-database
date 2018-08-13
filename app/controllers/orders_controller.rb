class OrdersController < ApplicationController

  post '/orders' do
    @order = Order.new(params[:order])
    @order.user = current_user
    @order.status = "accepted"
    @order.save

    redirect '/show'
  end

  post '/orders/:id/machine' do
    @order = Order.find(params[:id])
    @order.machine = params[:machine]
    @order.save

    redirect '/show'
  end

  post '/orders/:id/done' do
    @order = Order.find(params[:id])
    @order.status = "done"
    @order.save

    redirect 'show'
  end

  post '/orders/:id/status' do
    @order = Order.find(params[:id])
    @order.status = params[:status]
    @order.save

    redirect 'show'
  end

end

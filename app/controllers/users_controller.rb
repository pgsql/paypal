class UsersController < ApplicationController
  def sign_up
    @order = Order.new
  end

end

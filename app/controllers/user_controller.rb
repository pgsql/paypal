class UserController < ApplicationController
  skip_before_filter :authenticate_user!
  skip_before_filter :check_for_terms_acceptance
  skip_before_filter :check_for_access_period
  def sign_up
  end
end

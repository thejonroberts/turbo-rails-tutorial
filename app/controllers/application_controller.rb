class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :devise_controller?

  private

  def current_user
    # NOTE: Devise defines current_user: overridden here to preload associated company,
    # as it is needed on most all views.
    # see https://github.com/heartcombo/devise/issues/5452
    @current_user ||= super.tap do |user|
      # user.strict_loading!(false) # Can disable strict_loading instead if this is causing issues
      ActiveRecord::Associations::Preloader.new(records: [user], associations: [:company]).call
    end
  end
  helper_method :current_user

  def current_company
    @current_company ||= current_user.company if user_signed_in?
  end
  helper_method :current_company
end

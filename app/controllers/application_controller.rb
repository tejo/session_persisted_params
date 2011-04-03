class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :persist_params, :only => :index

  def persisted_params
    (self.class.to_s + "_persisted").to_sym
  end


  def persist_params
    session[persisted_params] ||= {} 
    [:page, :search].each do |k|
      if params[k] then
        session[persisted_params][k] = params[k]
      elsif session[persisted_params][k]
        params[k] = session[persisted_params][k]
      end
    end
  end


end

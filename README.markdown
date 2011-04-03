# Sample app with pagination, search and sort params persisted between pages

This is a very basic rails 3 app for showing a way to persist params between each requests through sessions. 
For this sample I use the both fantastics [kaminari](https://github.com/amatsuda/kaminari) and [meta search](http://metautonomo.us/projects/metasearch/)


### running it:

`bundle`

`rake db:migrate`

`rails s`


### all happens in application controller:

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

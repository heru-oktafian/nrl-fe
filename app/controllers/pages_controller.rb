class PagesController < ApplicationController
  def home
    @portfolio = ApiClient.get('/api/v1/public/portfolio')
  end
  
  def contact
    data = {
      name: params[:name],
      email: params[:email],
      subject: params[:subject],
      message: params[:message]
    }
    @result = ApiClient.post('/api/v1/contact', data)
  end
end
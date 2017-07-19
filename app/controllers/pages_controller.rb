class PagesController < ApplicationController
  before_action :set_kitten_url, only: [:kitten, :kittens]
  # before_action :contest

def welcome
 @header = "This is the my page"
#render :about -> call directly veiws
end

# /app/views/pages/kitten.html.erb
def kitten
 set_kitten_url
end

# /app/views/pages/kittens.html.erb
def kittens
 set_kitten_url
end

def set_kitten_url
  requested_size = params[:size]
  @kitten_url = "http://lorempixel.com/#{requested_size}/#{requested_size}/cats"
end

def contest
  cat_contest = params[:size]
  if cat_contest == "500"
    @contest_picture = "http://lorempixel.com/#{cat_contest}/#{cat_contest}/cats"
  else
    flash[:notice] = "Sorry, the contest has ended"
    render :welcome
  end
  # flash[:alert] = "Sorry, the contest has ended"
  # redirect_to kittens_path(300)
end

def secrets
  secrets_magic_word = params[:magic_word]
  if secrets_magic_word == "good"
    # redirect_to kitten_path(300)
    render :secrets
  else
    render :welcome
  end
end


end

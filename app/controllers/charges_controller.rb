class ChargesController < ApplicationController
  # before_action :set_search, only: [:show, :edit, :update, :destroy]

  require 'httparty'
  require 'rubygems'

  def index
    uri = '{    "pagination":{       "next":"https://api.venmo.com/v1/payments?limit=3&before=2013-12-27T16:43:40"    },    "data":[       {          "status": "pending",          "date_completed":null,          "target":{             "phone":null,             "type":"email",             "email":null,             "user":null          },          "audience":"public",          "actor":{             "username":"delavara",             "first_name":"Cody",             "last_name":"De La Vara",             "display_name":"Cody De La Vara",             "about":"So happy",             "profile_picture_url":"https://venmopics.appspot.com/u/v3/s/6ecc7b37-5c4a-49df-b91e-3552f02dc397",             "id":"1088551785594880949",             "date_joined":"2013-02-10T21:58:05"          },          "note":"Rock Climbing!",          "amount":4.0,          "action":"pay",          "date_created":"2013-12-30T19:40:57",          "id":"1322585332520059420"       },       {          "status":"settled",          "date_completed":"2013-12-27T19:35:41",          "target":{             "phone":null,             "type":"user",             "email":null,             "user":{                "username":"delavara",                "first_name":"Cody",                "last_name":"De La Vara",                "display_name":"Cody De La Vara",                "about":"So happy",                "profile_picture_url":"https://venmopics.appspot.com/u/v3/s/6ecc7b37-5c4a-49df-b91e-3552f02dc397",                "id":"1088551785594880949",                "date_joined":"2013-02-10T21:58:05"             }          },          "audience":"public",          "actor":{             "username":"matthewhamilton",             "first_name":"Matthew",             "last_name":"Hamilton",             "display_name":"Matthew Hamilton",             "about":"Paying the world with good vibes",             "profile_picture_url":"https://venmopics.appspot.com/u/v6/s/70b365a4-51a1-4076-9216-5d3fb9a9e517",             "id":"605862825558016432",             "date_joined":"2011-04-16T22:21:17"          },          "note":"Drinks on me!",          "amount": 7.00,          "action":"pay",          "date_created":"2013-12-27T19:35:41",          "id":"1320408353016382079"       }     ] }'
    # uri = HTTParty.post"https://api.venmo.com/v1/payments"
   @charges = JSON.parse(uri)
   # raise @charges.inspect
    @charges = @charges["data"]
    # raise test.inspect
  end


  def get_access_token_from_code(auth_code)
    client_secret = ENV["CLIENT_SECRET"]
    client_id = ENV["CLIENT_ID"]
      response = HTTParty.post("https://api.venmo.com/v1/oauth/access_token",
      :query => { :client_id => "#{client_id}", :client_secret => "#{client_secret}",
      :code => "#{auth_code}"})
  return response
  end



  def bill_dashboard
    @user = current_user
    if params["code"] && !@user.venmo_registered
      @user.update_attribute('auth_code', params["code"])

      response = get_access_token_from_code(params["code"])
      auth_token = response['access_token']
      user_id = response['user']['id']
      @user.update_attribute('auth_token', auth_token)
      @user.update_attribute('venmo_registered', true)
      @user.update_attribute('venmo_id', user_id)

   #  q_string1 = "https://api.venmo.com/v1/payments?access_token="
   #  t_string = '"JkNBB2yELzx93pWjnsXhqnS6raYeXvb8"'
   #  a_string = q_string1 + t_string
   #  uri = HTTParty.get a_string
   
   # @charges = JSON.parse(uri.body)
    end 
  end
    
   def show
   end

  def new
  end

  def create
  end

end




  

require 'xmpp4r_facebook'
require 'rest-graph'

class Fbm

  attr_writer :access_token

  APP_ID = '336967703070590'
  APP_SECRET = '96f23894a4fdb0d6366fc7066f651970'

  def login_url
    "https://www.facebook.com/dialog/oauth?client_id=#{APP_ID}" +
      "&redirect_uri=https://www.facebook.com/connect/login_success.html" +
      "&scope=xmpp_login,read_mailbox,friends_online_presence&response_type=token"
  end

  def me
    @me ||= client.get('me', :fields => 'name')
  end

  def friends
    client.get('me/friends', :fields => 'name,username')['data']
  end

  def message(id, text)
    to = "-#{id}@chat.facebook.com"
    message = Jabber::Message.new(to, text)
    jabber.send(message)
  end
  
  def close
    @jabber.close if @jabber
  end

  private
  def client
    @client ||= RestGraph.new(:access_token => @access_token)
  end

  def jabber
    @jid ||= "-#{me['id']}@chat.facebook.com"
    @jabber ||= Jabber::Client.new(Jabber::JID.new(@jid))
    @jabber.connect
    @jabber.auth_sasl(Jabber::SASL::XFacebookPlatform.new(@jabber, APP_ID, @access_token, APP_SECRET), nil)
    @jabber
  end

end



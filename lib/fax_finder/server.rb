module FaxFinder
  module ClassMethods
    attr_reader :host, :user, :password
    def configure(_host, _user, _password)
      @host, @user, @password=_host, _user, _password
    end
    
    def reset
      @host=@user=@password=nil
    end

  end

  class Server
  end
end
FaxFinder::Server.send(:extend, FaxFinder::ClassMethods)

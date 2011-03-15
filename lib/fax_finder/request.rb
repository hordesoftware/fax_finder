module FaxFinder
  module RequestClassMethods
    attr_reader :host, :user, :password
    def configure(_host, _user, _password)
      @host, @user, @password=_host, _user, _password
    end

    def reset
      @host=@user=@password=nil
    end
  end
  class Request
    TIME_FORMAT="%Y-%m-%dT%H:%M:%S"
  end    
end

FaxFinder::Request.send(:extend, FaxFinder::RequestClassMethods)

require 'net/http'
require 'net/https'

module FaxFinder
  module RequestClassMethods
    attr_reader :host, :user, :password, :ssl
    def configure(_host, _user, _password, _ssl=false)
      @host, @user, @password, @ssl=_host, _user, _password, _ssl
    end

    def reset
      @host=@user=@password=nil
    end

    def formatted_fax_finder_time(time)
      result=nil
      if time
        result=(time.utc? ? time : time.utc).strftime(Request::TIME_FORMAT)
      end
      result
    end
    
    # def uri(path)
    #   (self.ssl ? URI::HTTPS : URI::HTTP).build(:host=>self.host, :path=>path)
    # end
  end
  
  class Request
    TIME_FORMAT="%Y-%m-%dT%H:%M:%S"
    CONTENT_TYPE='text/xml'
  end    

end

FaxFinder::Request.send(:extend, FaxFinder::RequestClassMethods)

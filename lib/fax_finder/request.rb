require 'net/http'
require 'net/https'

module FaxFinder
  module Constants
    BASE_PATH='/ffws/v1/ofax'
  end
  
  module RequestClassMethods
    attr_reader :host, :user, :password, :ssl
    def configure(_host, _user, _password, _ssl=false)
      @host, @user, @password, @ssl=_host, _user, _password, _ssl
    end

    def reset
      @host=@user=@password=nil
    end

    def post
      response_body=nil
      Net::HTTP.start(Request.host) { |http|  
        http_request = yield
        http_response = http.request(http_request)
        response_body=http_response.body
      }
      return Response.new(Nokogiri::XML(response_body))
    end

    def formatted_fax_finder_time(time)
      result=nil
      if time
        result=(time.utc? ? time : time.utc).strftime(Request::TIME_FORMAT)
      end
      result
    end
    
  end
  
  class Request
    include Constants
    TIME_FORMAT="%Y-%m-%dT%H:%M:%S"
    CONTENT_TYPE='text/xml'
  end    

end

FaxFinder::Request.send(:extend, FaxFinder::RequestClassMethods)

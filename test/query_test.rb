require File.dirname(__FILE__) + '/test_helper'

module FaxFinder
  class QueryGetTest<Test::Unit::TestCase
    def setup
      Request.configure('example.com', 'user', 'password')
    end
    
    def test_get
      Query.get('user', 'password')
    end
    
    def test_gets_returns_response
      assert_instance_of(FaxFinder::Response, Query.get(nil, nil))
    end
  end

  class QueryConstructHttpRequestTest<Test::Unit::TestCase
    def setup
      Request.configure('example.com', 'user', 'password')
      @http_request=Query.construct_http_request('fax_key', 'entry_key')
    end

    def test_returns_a_get
      assert_instance_of(Net::HTTP::Get, @http_request)
    end
    
    def test_sets_path
      assert_equal(Query.path('fax_key', 'entry_key'), @http_request.path)
    end
    
    def test_sets_basic_auth
      assert_not_nil(@http_request['authorization'])
    end

    def test_sets_content_type
      assert_equal('text/xml', @http_request['Content-Type'])
    end
  end

  class QueryPathTest<Test::Unit::TestCase
    def setup
    end
    
    def test_constructs_using_base_path
      assert_equal(Request::BASE_PATH+'/'+'fax_key' +'/'+'entry_key', Query.path('fax_key', 'entry_key'))
    end
    
  end
  
end

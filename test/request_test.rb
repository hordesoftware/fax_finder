require File.dirname(__FILE__) + '/test_helper'

module FaxFinder

    class RequestSetupTest<Test::Unit::TestCase
      def setup
        Request.configure('example.com', 'user', 'password', true)
      end

      def test_setup_host
        assert_equal('example.com', Request.host)
      end

      def test_setup_user
        assert_equal('user', Request.user)
      end

      def test_setup_password
        assert_equal('password', Request.password)
      end

      def test_setup_ssl
        assert_equal(true, Request.ssl)
      end

    end

    class RequestResetTest<Test::Unit::TestCase
      def setup
        Request.configure('example.com', 'user', 'password')
        Request.reset
      end

      def test_setup_host
        assert_nil(Request.host)
      end

      def test_setup_user
        assert_nil(Request.user)
      end

      def test_setup_password
        assert_nil(Request.password)
      end

    end

  
    # class RequestUriTest<Test::Unit::TestCase
    #   def setup
    #     Request.configure('example.com', 'user', 'password')
    #   end
    #   
    #   def test_returns_uri
    #     assert(Request.uri('/').is_a?(URI::Generic))
    #   end
    # 
    #   def test_handles_nil
    #     assert_nothing_thrown {Request.uri('/')}
    #   end
    #   
    #   def test_uses_the_configured_host
    #     assert_equal('example.com', Request.uri('/').host)
    #   end
    #   
    #   def test_does_not_blow_up_if_host_is_not_configured
    #     Request.reset
    #     assert_nothing_thrown {Request.uri('/')}
    #   end
    #   
    #   def test_handles_https
    #     Request.configure('example.com', 'user', 'password', true)
    #     assert_instance_of(URI::HTTPS, Request.uri('/'))
    #   end
    # end
  
end

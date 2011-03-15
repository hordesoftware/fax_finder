require File.dirname(__FILE__) + '/test_helper'

module FaxFinder

    class RequestSetupTest<Test::Unit::TestCase
      def setup
        Request.configure('example.com', 'user', 'password')
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

    end

    class RequestSetupTest<Test::Unit::TestCase
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

  
end

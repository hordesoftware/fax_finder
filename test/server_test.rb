require File.dirname(__FILE__) + '/test_helper'

module FaxFinder
  class ServerSetupTest<Test::Unit::TestCase
    def setup
      Server.configure('example.com', 'user', 'password')
    end
    
    def test_setup_host
      assert_equal('example.com', Server.host)
    end

    def test_setup_user
      assert_equal('user', Server.user)
    end

    def test_setup_password
      assert_equal('password', Server.password)
    end

  end

  class ServerSetupTest<Test::Unit::TestCase
    def setup
      Server.configure('example.com', 'user', 'password')
      Server.reset
    end
    
    def test_setup_host
      assert_nil(Server.host)
    end

    def test_setup_user
      assert_nil(Server.user)
    end

    def test_setup_password
      assert_nil(Server.password)
    end

  end
  
end

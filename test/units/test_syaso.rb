# encoding: utf-8

require "test_helper"

class TestSyaso < Test::Unit::TestCase
  context "Syaso" do
    setup do
      setup_view
      
      @html_class = [:test, :class]
      @syaso = Syaso::Base.new(@context)
    end # setup
    
    should "process content" do
      @syaso.render("test", :class => @html_class)
    end
    
    should "process html class attributes" do
      @syaso.render(:class => @html_class)
      @html_class.to_s.split(" ").each do |c|
        assert_match(/class="[^"]*#{@c}[^"]*"/, output)
      end
    end
    
    should "process no html class attributes" do
      @syaso.render
      assert_not_match(/class/, output)
    end
    
    teardown do
      puts output
    end # teardown
  end # context "Syaso"
end

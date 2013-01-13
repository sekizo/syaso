# encoding: utf-8

require "test_helper"

class TestSyaso < Test::Unit::TestCase
  context "Syaso" do
    setup do
      setup_view
      @content = "content"
      @html_class = [:test, :class]
      @syaso = Syaso::Base.new(@context)
    end # setup
    
    should "process content" do
      @syaso.render(@content, :class => @html_class)
      assert_match(/#{@content}/, output)
    end
    
    should "process no content" do
      @syaso.render(:class => @html_class)
      assert_not_match(/#{@content}/, output)
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
    
    context "data-* attribtues" do
      setup do
        @options = {:class => @html_class}
        @data = {:view => :syaso, :role => :view}
        
        @expect = lambda { |k,v| /data-#{k}="[^"]*#{v}[^"]*"/ }
      end
      
      should "render" do
        options = @options
        options[:data] = @data
        @syaso.render(@content, options)
        
        @data.each do |k, v|
          assert_match(@expect.call(k, v), output)
        end
      end # should "render"
      
      should "render by '_*' instead of 'data-*'" do
        @data.each do |k, v|
          @options["_#{k}"] = v
        end
        @syaso.render(@content, @options)
        
        @data.each do |k, v|
          assert_match(@expect.call(k, v), output)
        end
      end # should "render by '_*' instead of 'data-*'"
    
    end # context "data-* attribtues"
    
    
    teardown do
      puts output
    end # teardown
  end # context "Syaso"
end

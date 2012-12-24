# encoding: utf-8

require "test_helper"

class TestSyasoList < Test::Unit::TestCase
  context "Syaso::List" do
    
    setup do
      setup_view
      @records = [1, 2, 3]
      @list = Syaso::List.new(@context, @records)
    end # setup
    
    should "default render ul" do
      @list.render
      assert(output.match(/^<ul[^\>]*>/), "List begin with '<ul>'.")
    end # should "default render ul"
    
    should "respond to render items" do
      assert_nothing_raised(Exception) do
        @list.render(:class => [:container]) do |item|
          item.content
        end # list.render
      end # assert
    end # should "respond to render items"
    
    should "respond to render item" do
      assert_nothing_raised(Exception) do
        @list.each(:class => [:container]) do |item|
          item.render(:tag => :p, :id => lambda {|i| "item_#{i.content}"}) do |i|
            i.content
          end # item.render
        end # list.each
      end # assert
    end # should "respond to render item"
    
    teardown do
      puts output
    end # teardown
    
  end # context "Syaso"
end

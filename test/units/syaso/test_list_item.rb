# encoding: utf-8

require "test_helper"

class TestSyasoListItem < Test::Unit::TestCase
  context "Syaso::ListItem" do
    setup do
      setup_view
      @item = 1
      @list = Syaso::List.new(@context, [@item])
      @view = Syaso::ListItem.new(@context, @list, @item)
    end
    
    should "render" do
      @view.render do |i|
        @context.concat(i.content)
      end
      
      assert(output.match(/^<li[^<]*>.*<\/li>$/))
    end # should "render"
    
    should "render attributes" do
      @context.concat(
        @view.render(:class => [:item]) do |v|
          @context.concat v.content
        end
      )
      
      assert(output.match(/class=\"item\"/))
    end # should "render attributes"
    
    teardown do
      puts output
    end # teardown
    
  end # contect "Syaso::ListItem"

end
# encoding: utf-8

require "syaso/base"
require "syaso/list_item"

class Syaso::List < Syaso::Base
  #--------------------#
  # content
  
  ITEM_VIEW = Syaso::ListItem
  
  # initialize instance
  #
  # @param  [ActionView]  context
  # @param  [Array] content
  def initialize(context, content)
    super(context)
    self.content = content
  end
  
  # render list
  #
  # @param  [Hash]  options
  def render(options = {}, &block)
    ops = options.delete(:item)||{}
    self.each(options) do |i|
      i.render(ops, &block)
    end
  end
  
  # render container and iterate items
  #
  # @param  [Hash]  options
  def each(options = {}, &block)
    self._render(options) do |v|
      self.content.each do |i|
        yield(self.item_view(i))
      end
    end
  end
  
  #--------------------#
  protected
  
  # item view
  #
  # @param  [Object]  item
  def item_view(item)
    ITEM_VIEW.new(self.context, self, item)
  end
  
  # default html tag
  #
  # @return [Symbol]
  def default_html_tag
    :ul
  end
  
  # default html class
  def default_html_class
    [:list]
  end
end

module Syaso
  # list view instance
  #
  # @param  [ActionView]  context
  # @param  [Array] list
  def self.list(context, list)
    Syaso::List.new(context, list)
  end
end

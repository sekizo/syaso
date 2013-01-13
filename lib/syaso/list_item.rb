# encoding: utf-8

require "syaso/base"

class Syaso::ListItem < Syaso::Base
  # initialize instance
  #
  # @param  [ActionView]  context
  # @param  [Syaso::Base] holder
  # @param  [Object]  content
  def initialize(context, holder, content)
    super(context)
    self.holder = holder
    self.content = content
  end
  
  # index of this content in list's content.
  #
  # @return [Integer]
  def index
    self.holder.index(self.content)
  end
  
  #--------------------#
  protected
  
  # ListItem holder
  attr_writer :holder
  
  # default html tag
  #
  # @return [Symbol]
  def default_html_tag
    :li
  end
end

# encoding: utf-8

require "syaso/base"

class Syaso::ListItem < Syaso::Base
  def initialize(context, holder, content)
    super(context)
    self.holder = holder
    self.content = content
  end
  
  def index
    self.holder.index(self.content)
  end
  
  #--------------------#
  protected
  
  attr_writer :holder
  
  def default_html_tag
    :li
  end
end

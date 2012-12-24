# encoding: utf-8

class Syaso::Base
  #--------------------#
  # constants
  
  #--------------------#
  # attributes
  
  attr_reader :content
  
  #--------------------#
  # class methods
    
  #--------------------#
  # instance methods
  
  # initialize method
  #
  # @param  [ActionView]  context
  def initialize(context)
    super()
    self.context = context
    #@@default_html_tag ||= :div
    #@@default_html_class ||= []
  end
  
  def render(options = {}, &block)
    self._render(options, &block)
  end
  #--------------------#
  protected
  
  attr_accessor :tag, :context
  attr_writer   :content
  
  # render method
  #
  # @param  [Hash]  options
  def _render(options = {}, &block)
    ops = filter_options(options)
    self.buffer do
      self.context.content_tag(self.tag, ops) do
        self.buffer do
          block_given? ? yield(self) : self.content
        end
      end # context.content_tag
    end # buffer
  end # context.concat
  
  # buffer contents
  def buffer(&block)
    self.context.concat(yield)
    ""
  end
  
  # default tag
  #
  # @return [Symbol]
  def default_html_tag
    :div
  end
  
  # default html classes
  #
  # @return [Array<String>]
  def default_html_class
    []
  end
  
  #--------------------#
  private
  
  # filter html options
  #
  # @param  [Hash]  options
  # @return [Hash]
  def filter_options(options = {})
    ops = options.dup
    
    options.each do |k, v|
      ops[k] = v.is_a?(Proc) ? v.call(self) : v
    end
    
    self.tag = ops.delete(:tag)||self.default_html_tag
    ops = filter_html_class_options(ops)
    ops
  end
  
  # filter html classes
  #
  # @param  [Hash]  options
  # @return [Hash]
  def filter_html_class_options(options = {})
    options[:class] ||= []
    options[:class] = options[:class].to_s.split(" ") unless options[:class].is_a?(Array)
    options[:class] += self.default_html_class
    options.delete(:class) if options[:class].blank?
    options
  end
  
  # method missing
  #
  # @param  [Symbol]  name
  # @param  [Array] args
  def method_missing(name, *args, &block)
    begin
      self.content.__send__(name, *args, &block)
    rescue => e
      super
    end
  end
end
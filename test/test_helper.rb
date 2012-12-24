# encoding: utf-8

require "action_view"
require "shoulda"
require "test/unit"

file = File.expand_path("../../lib/syaso", __FILE__)
require file

def setup_view
  @context = ActionView::Base.new
  @context.output_buffer = ""
end

def output
  @context.output_buffer
end
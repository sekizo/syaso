# Syaso

ActionView helper.

## Installation

Add this line to your application's Gemfile:

    gem 'syaso'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install syaso

## Usage

in Gemfile
	
	gem "syaso"
	
in app/views/SOME_VIEW.html.erb
	
	# Syaso::List
	<%= Syaso.list(@records).render(:class => [:padding], :item => { :style => "border-bottom:1px solid Gray" }) do |item| %>
	  <%= item.name %>
	<% end %>
	
	# or

	<%= Syaso.list(@records).each(:class => [:padding]) do |item| %>
	  <%= item.render(:style => "border-bottom:1px solid Gray") do |i| %>
	    <%= i.name %>
	  <% end 
	<% end %>
	
	

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

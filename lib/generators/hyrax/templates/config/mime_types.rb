# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf
# Mime::Type.register_alias "text/html", :iphone
Mime::Type.register 'application/x-endnote-refer', :endnote
Mime::Type.register "application/xml", :xml, %w( text/xml application/x-xml )
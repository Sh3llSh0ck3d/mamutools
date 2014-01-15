#!/usr/bin/env ruby
#
# JSON Parser & Prettifier
# http://cixtor.com/
# https://github.com/cixtor/mamutools
# http://en.wikipedia.org/wiki/JSON
#
# JSON or JavaScript Object Notation, is a text-based open standard designed for
# human-readable data interchange. It is derived from the JavaScript scripting
# language for representing simple data structures and associative arrays, called
# objects. Despite its relationship to JavaScript, it is language-independent,
# with parsers available for many languages.
#
# The JSON format was originally specified by Douglas Crockford, and is described
# in RFC 4627. The official Internet media type for JSON is application/json. The
# JSON filename extension is .json. The JSON format is often used for serializing
# and transmitting structured data over a network connection. It is used primarily
# to transmit data between a server and web application, serving as an alternative
# to XML.
#
require 'rubygems'
require 'json'
require 'open-uri'
#
url = !ARGV[0].nil? ? ARGV[0] : ''
if not url.empty? then
    if File.exists?(url) then
        content = File.open(url, 'rb'){ |f| f.read }
    else
        response = open(url)
        content = response.read
    end
    puts JSON.pretty_generate(JSON.parse(content))
end
#
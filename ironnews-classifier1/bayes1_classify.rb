#! ruby -Ku

require "cgi"
require "open-uri"
require "rubygems"
require "json"

HOST = "localhost:8080"
#HOST = "ironnews-classifier1.appspot.com"

body = "「ＪＲ西歴代３社長起訴を」　脱線事故遺族、検察審に申し立て"
puts(body)

url  = "http://#{HOST}/bayes1/classify"
url += "?body=" + CGI.escape(body)

result = open(url) { |io| JSON.parse(io.read) }
result.each { |category, prob|
  puts("#{category}: #{prob}")
}

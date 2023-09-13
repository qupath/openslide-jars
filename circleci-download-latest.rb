#! /usr/bin/env ruby
require "net/http"
require "json"
require "optparse"

options = {}
optparse = OptionParser.new do |parser|
  parser.banner = "Usage: cci.rb -u USERNAME -p PROJECT -j JOB -a artifact"
  parser.on("-u", "--username USERNAME", "Github username") do |u|
    options[:username] = u
  end
  parser.on("-r", "--repo REPOSITOR", "Github repository") do |r|
    options[:repo] = r
  end
  parser.on("-b", "--branch BRANCH", "git branch") do |b|
    options[:b] = b
  end
end

begin
  optparse.parse!
  mandatory = [:username, :repo, :branch]
  missing = mandatory.select{
    |param| options[param].nil?
  }
  unless missing.empty?
    raise OptionParser::MissingArgument.new(missing.join(', '))
  end
rescue OptionParser::InvalidOption, OptionParser::MissingArgument
  puts $!.to_s
  puts optparse
  exit
end

url = "https://circleci.com/api/v1.1/project/github/%{username}/%{repo}/latest/artifacts?branch=%{branch}&filter=successful"
uri = URI.parse url % {
  username: options[:username],
  repo: options[:repo],
  branch: options[:branch]
}

response = Net::HTTP.get(uri)
artifact_url = JSON.parse(response)[0]["url"]

`wget #{artifact_url}`

#!/usr/bin/env ruby
# frozen_string_literal: true

# To install the prerequisites, use the command below:
#   pacman -S ruby-nokogiri

require 'json'
require 'nokogiri'
require 'open-uri'

def get_json
  res = URI.open('https://www.tenable.com/downloads/nessus')
  doc = Nokogiri::HTML(res)
  json = doc.at_css('#__NEXT_DATA__').content
  JSON.parse(json)
end

def get_link
  data = get_json
  url, filename = nil
  downloads = data['props']['pageProps']['page']['downloads']
  downloads.each do |download|
    filename = download['file']
    if filename.end_with?('-fc38.x86_64.rpm')
      url = "https://www.tenable.com/downloads/api/v1/public/pages/nessus/downloads/#{download['id']}/download?i_agree_to_tenable_license_agreement=true"
      break
    end
  end
  raise 'Cannot find a download link!' if url.nil?

  puts filename
  puts url
end

get_link if __FILE__ == $PROGRAM_NAME

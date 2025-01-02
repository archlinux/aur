#!/usr/bin/env ruby
# frozen_string_literal: true

# To install the prerequisites, use the command below:
#   pacman -S ruby-nokogiri

require 'json'
require 'nokogiri'
require 'open-uri'

def get_json
  res = URI.open('https://www.tenable.com/downloads/nessus-agents')
  doc = Nokogiri::HTML(res)
  json = doc.at_css('#__NEXT_DATA__').content
  JSON.parse(json)
end

def get_link
  data = get_json
  url, filename, version, dl_id, sha256 = nil
  downloads = data['props']['pageProps']['page']['downloads']
  downloads.each do |download|
    filename = download['file']
    if filename.end_with?('-fc38.x86_64.rpm')
      url = "https://www.tenable.com/downloads/api/v1/public/pages/nessus-agents/downloads/#{download['id']}/download?i_agree_to_tenable_license_agreement=true"
      dl_id = download['id']
      version = download['meta_data']['version']
      sha256 = download['meta_data']['sha256']
      break
    end
  end
  raise 'Cannot find a download link!' if url.nil?

  {filename: filename, url: url, version: version, dl_id: dl_id, sha256: sha256}
end

if __FILE__ == $PROGRAM_NAME
  arg = ARGV.first
  if %w[filename url version dl_id sha256].include?(arg)
    puts get_link[arg.to_sym]
  elsif arg == 'all'
    puts get_link.values.join(' ')
  end
end

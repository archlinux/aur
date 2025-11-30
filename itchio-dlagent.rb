#!/usr/bin/env ruby

#  itchio-dlagent is licensed under the BSD Zero Clause License
#
#  Copyright (C) Filth 
#  Permission to use, copy, modify, and/or distribute this software for
#  any purpose with or without fee is hereby granted.
#
#  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
#  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
#  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
#  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
#  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
#  AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT
#  OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

require 'httpx'
require 'json'
require 'nokogiri'

class ItchDownloader
  def initialize
    @client = HTTPX.plugin(:follow_redirects)
  end

  def run(input_string, filename = nil)
    user, project, file_id = parse_input(input_string)
    raise ArgumentError, "Invalid file_id" unless file_id.match?(/^\d+$/)
    base_url = "https://#{user}.itch.io/#{project}"
    
    csrf_token = get_token(base_url)
    download_url = get_download_url("#{base_url}/file/#{file_id}", csrf_token)
    download_file(download_url, filename)
  end

  private

  def parse_input(input)
    clean_input = input.to_s.sub("itch://", "")
    parts = clean_input.split("/").reject(&:empty?)
      
    if parts.size != 3
      raise ArgumentError, "Invalid input '#{input}'. Expected format: 'user/project/file_id'"
    end
      
    parts
  end

  def get_token(url)
    response = @client.get(url)
    
    html = Nokogiri::HTML(response.body.to_s)
    token = html.at('meta[name="csrf_token"]')&.[]('value')
    raise "Could not find CSRF token." unless token

    token
  end

  def get_download_url(url, csrf_token)
    response = @client.post(url, form: { csrf_token: csrf_token })
    raise "Failed to get download URL: #{response.status} - #{response.body}" unless response.status == 200

    data = JSON.parse(response.to_s)
    raise "No URL found" if data["url"].nil?
    data["url"]
  end

  def download_file(url, filename)
    response = @client.plugin(:stream).get(url, stream: true)
    raise "Download failed: #{response.status}" unless response.status == 200

    filename ||= extract_filename(response)

    File.open(filename, "wb") do |file|
      response.each do |chunk|
        file.write(chunk)
      end
    end
  end

  def extract_filename(response)
    header = response.headers["content-disposition"]
    match = header&.match(/filename="?([^"]+)"?/)
    match ? match[1] : "downloaded_file"
  end
end

if ARGV.empty?
  puts "Usage: itchio-dlagent 'user/project/file_id' [output_filename]"
  exit 1
end

begin
  downloader = ItchDownloader.new
  downloader.run(ARGV[0], ARGV[1])
rescue StandardError => e
  STDERR.puts "Error: #{e.message}"
  exit 1
end

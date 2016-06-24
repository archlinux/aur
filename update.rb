#!/usr/bin/env ruby
# Initial work on updater script for pkg files.
# This still is mostly a hack and could be vastly improved.

require 'date'
require 'net/http'

# First determine the folder to download from.
# TODO: Account for update time zone.
now = DateTime.now
year = now.year
month = now.month.to_s.rjust(2, "0")
day = now.day.to_s.rjust(2, "0")
base_uri = URI "https://ftp.mozilla.org/pub/firefox/nightly/#{year}/#{month}/"
response = Net::HTTP.get(base_uri)
search = %r~href="(/pub/firefox/nightly/#{year}/#{month}/#{year}-#{month}-#{day}-([0-9-]+)-mozilla-aurora-l10n/)"~
result = search.match response
abort("No updated available yet") if result.nil?
#url = "https://ftp.mozilla.org/#{result[1]}"

# Update PKGBUILD with new values.
release_time = result[2]
pkgbuild = File.read "PKGBUILD"
pkgbuild.gsub!(/^_release_year=.*$/, "_release_year=#{year}")
pkgbuild.gsub!(/^_release_month=.*$/, "_release_month=#{month}")
pkgbuild.gsub!(/^_release_day=.*$/, "_release_day=#{day}")
pkgbuild.gsub!(/^_release_time=.*$/, "_release_time=#{release_time}")
#pkgbuild.gsub!(/^_release_version=.*$/, "_release_version=#{release_version}")

# Write new PKGBUILD.
File.open "PKGBUILD", "w" do |file|
    file.write pkgbuild
end

# Update package sums & srcinfo.
exec "updpkgsums"
exec "mksrcinfo"


#!/usr/bin/env ruby
# Initial work on updater script for pkg files.
# This still is mostly a hack and could be vastly improved.

require 'date'
require 'net/http'

FF_VERSION = "49.0a2"

# First determine the folder to download from.
# TODO: Account for update time zone.
now = DateTime.now
year = now.year
month = "%02d" % now.month
day = "%02d" % now.day
request_url = URI "https://ftp.mozilla.org/pub/firefox/nightly/#{year}/#{month}/"
response = Net::HTTP.get(request_url)
search = %r~href="(/pub/firefox/nightly/#{year}/#{month}/#{year}-#{month}-#{day}-([0-9-]+)-mozilla-aurora-l10n/)"~
result = search.match response
abort("No updated available yet") if result.nil?
#base_url = "https://ftp.mozilla.org/#{result[1]}"

# Update PKGBUILD with new values.
release_time = result[2]
pkgbuild = File.read "PKGBUILD"
pkgbuild.gsub!(/^_release_year=.*$/, "_release_year=#{year}")
pkgbuild.gsub!(/^_release_month=.*$/, "_release_month=#{month}")
pkgbuild.gsub!(/^_release_day=.*$/, "_release_day=#{day}")
pkgbuild.gsub!(/^_release_time=.*$/, "_release_time=#{release_time}")
pkgbuild.gsub!(/^_release_version=.*$/, "_release_version=#{FF_VERSION}")

# Write new PKGBUILD.
File.open "PKGBUILD", "w" do |file|
    file.write pkgbuild
end

# Make sure the old src downloads don't exist anymore.
Dir["firefox-*.de.linux-x86_64.tar.bz2"].each {|f| File.unlink f}

# Update package sums & srcinfo.
system "updpkgsums"
system "mksrcinfo"

# If run with --publish it will be uploaded to the remotes.
if ARGV.include? "--publish"
    puts "Publishing update to AUR."
    system "git add PKGBUILD .SRCINFO"
    system "git commit -m 'Automatic upgrade to version #{FF_VERSION}_#{year}#{month}#{day}.'"
    system "git push"
end


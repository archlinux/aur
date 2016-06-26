#!/usr/bin/env ruby
# Initial work on updater script for pkg files.
# This still is mostly a hack and could be vastly improved.

require 'date'
require 'net/http'

FF_VERSION = "49.0a2"

# Check current version.
pkgbuild = File.read "PKGBUILD"
current_version = Date.new(
	/^_release_year=(\d+)$/.match(pkgbuild)[1].to_i,
	/^_release_month=(\d+)$/.match(pkgbuild)[1].to_i,
	/^_release_day=(\d+)$/.match(pkgbuild)[1].to_i
)

def attempt_upgrade (date)
	# Format date components.
	year = date.year
	month = "%02d" % date.month
	day = "%02d" % date.day
	puts "Attempting upgrade to version #{date}"

	# Find directory on server.
	request_url = URI "https://ftp.mozilla.org/pub/firefox/nightly/#{year}/#{month}/"
	response = Net::HTTP.get(request_url)
	search = %r~href="/(pub/firefox/nightly/#{year}/#{month}/#{year}-#{month}-#{day}-([0-9-]+)-mozilla-aurora-l10n/)"~
	result = search.match response
	return false if result.nil?
	release_time = result[2]

	# Check if the release actually exists (sometimes it's not included in the directory).
	base_url = "https://ftp.mozilla.org/#{result[1]}"
	filename = "firefox-#{FF_VERSION}.de.linux-x86_64.tar.bz2"
	uri = URI(base_url + filename)
	
	request = Net::HTTP.new uri.host
	response = request.request_head uri.path
	if response.code.to_i != 200
		puts "Found directory on server (#{year}-#{month}-#{day}) but no file."
		return false
	end

	# Update PKGBUILD file.
	pkgbuild = File.read "PKGBUILD"
	pkgbuild.gsub!(/^_release_year=.*$/, "_release_year=#{year}")
	pkgbuild.gsub!(/^_release_month=.*$/, "_release_month=#{month}")
	pkgbuild.gsub!(/^_release_day=.*$/, "_release_day=#{day}")
	pkgbuild.gsub!(/^_release_time=.*$/, "_release_time=#{release_time}")
	pkgbuild.gsub!(/^_release_version=.*$/, "_release_version=#{FF_VERSION}")
	
	File.open "PKGBUILD", "w" do |file|
	    file.write pkgbuild
	end
	
	true
end

# Update logic. Start with tomorrow (to account for timezone differences) and work back in time
# and pick the most recent version or cancel if we arrive at the current version.
new_version = Date.today.next_day
success = false
while current_version < new_version
	success = attempt_upgrade(new_version)
	if success
		break
	else
		new_version = new_version.prev_day
	end
end

if success
	puts "Finishing update to version #{new_version}."

	# Make sure the old src downloads don't exist anymore.
	Dir["firefox-*.de.linux-x86_64.tar.bz2"].each {|f| File.unlink f}

	# Update package sums & srcinfo.
	system "updpkgsums"
	system "mksrcinfo"

	# If run with --publish it will be uploaded to the remotes.
	if ARGV.include? "--publish"
	    puts "Publishing update to AUR."
	    system "git add PKGBUILD .SRCINFO"
	    system "git commit -m 'Automatic upgrade to version #{FF_VERSION} (#{new_version}).'"
	    system "git push"
	end
else
	puts "No update was available."
end


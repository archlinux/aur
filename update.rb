#!/usr/bin/env ruby

require 'json'
require 'net/http'
require 'uri'

class Hash
  def symbolize_keys!
    keys.each do |key|
      self[key.to_sym] = delete(key)
    end
  end
end

PKGBUILD_TEMPLATE = <<END
# Maintainer: Joakim Reinert <mail@jreinert.com>

_gemname=xapian-findex
pkgname=ruby-$_gemname
pkgver=%{number}
pkgrel=1
pkgdesc='%{summary}'
arch=(any)
url='https://github.com/jreinert/findex'
license=(MIT)
depends=(ruby ruby-xapian ruby-filemagic)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('%{sha}')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
}
END

gem_name = nil
gem_version = nil

File.open('PKGBUILD') do |f|
  f.each do |line|
    match = line.match(/^(_gemname=(?<gem_name>\S+)|pkgver=(?<gem_version>\S+))/)
    next unless match
    gem_name ||= match[:gem_name]
    gem_version ||= match[:gem_version]
    break if gem_name && gem_version
  end
end

unless gem_name && gem_version
  abort("Couldn't parse gem name and/or version from PKGBUILD")
end

uri = URI('https://rubygems.org')

Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
  response = http.get("/api/v1/versions/#{gem_name}/latest.json")
  json_response = JSON.parse(response.body)
  latest_version = json_response['version']

  if gem_version == latest_version
    puts "Already up to date"
    exit
  end

  response = http.get("/api/v1/versions/#{gem_name}.json")
  json_response = JSON.parse(response.body)
  version_object = json_response.find { |version| version['number'] == latest_version }
  version_object.symbolize_keys!
  File.write('PKGBUILD', format(PKGBUILD_TEMPLATE, version_object))

  system('mksrcinfo')
  system('git add PKGBUILD .SRCINFO')
  system("git commit -m 'update to gem version #{latest_version}")
  system("git push")
end

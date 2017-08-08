# Maintainer: Andrew Stubbs <andrew.stubbs@gmail.com>
pkgname=etcher
_realver=1.1.2
pkgver=${_realver//-/_}
pkgrel=1
pkgdesc="Burn images to SD cards & USB drives, safe & easy"
arch=('i686' 'x86_64')
url="http://www.etcher.io/"
license=('apache')
depends=('gtk2' 'libxtst' 'libxss' 'gconf' 'nss' 'alsa-lib')
optdepends=('libnotify: for notifications'
	    'speech-dispatcher: for text-to-speech')
source_i686=("https://github.com/resin-io/etcher/releases/download/v${_realver}/etcher-electron_${_realver}_i386.deb")
source_x86_64=("https://github.com/resin-io/etcher/releases/download/v${_realver}/etcher-electron_${_realver}_amd64.deb")
options=("!strip")
sha256sums_i686=('98ff8eaa21710a3fcd9c17f0d8153b85c64d7a90473fca0315c38fd95f41ec5a')
sha256sums_x86_64=('45ab555e470b382120923730e607e7a951da4f6d8a4320f0f08a960f8254942b')


package() {
    cd "$pkgdir"
    tar xf "$srcdir/data.tar.xz"
}

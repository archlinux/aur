# Maintainer: Andrew Stubbs <andrew.stubbs@gmail.com>
pkgname=etcher
_realver=1.1.1
pkgver=${_realver//-/_}
pkgrel=1
pkgdesc="Burn images to SD cards & USB drives, safe & easy"
arch=('i686' 'x86_64')
url="http://www.etcher.io/"
license=('apache')
depends=('gtk2' 'libxtst' 'libxss' 'gconf' 'nss' 'alsa-lib')
optdepends=('libnotify: for notifications'
	    'speech-dispatcher: for text-to-speech')
source_i686=("https://github.com/resin-io/etcher/releases/download/v1.1.1/etcher-electron_${_realver}_i386.deb")
source_x86_64=("https://github.com/resin-io/etcher/releases/download/v1.1.1/etcher-electron_${_realver}_amd64.deb")
options=("!strip")
sha256sums_i686=('643a9a0830ac6f044058eb20c95b8dec45e84f2f40af69271984a6b7689e61a3')
sha256sums_x86_64=('896a3520ee67304caab9f385fd9c6acd57a3f709b4728045df59afb5a2457a4d')


package() {
    cd "$pkgdir"
    tar xf "$srcdir/data.tar.xz"
}

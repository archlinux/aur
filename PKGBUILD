# Maintainer: Andrew Stubbs <andrew.stubbs@gmail.com>
pkgname=etcher
_realver=1.2.1
pkgver=${_realver//-/_}
pkgrel=1
pkgdesc="Burn images to SD cards & USB drives, safe & easy"
arch=('x86_64')
url="http://www.etcher.io/"
license=('apache')
depends=('gtk2' 'libxtst' 'libxss' 'gconf' 'nss' 'alsa-lib')
optdepends=('libnotify: for notifications'
	    'speech-dispatcher: for text-to-speech')
source_x86_64=("https://github.com/resin-io/etcher/releases/download/v${_realver}/etcher-electron_${_realver}_amd64.deb")
options=("!strip")
sha256sums_x86_64=('c28005e3613a3ead8d7ae0a78519914301bf160665b1021d0ff5cf12d4719f87')


package() {
    cd "$pkgdir"
    tar xf "$srcdir/data.tar.xz"
}

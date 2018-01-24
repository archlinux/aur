# Maintainer: Andrew Stubbs <andrew.stubbs@gmail.com>
pkgname=etcher
_realver=1.3.1
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
sha256sums_x86_64=('366a083b6009ae75830fd920a947812ab9c7ec3a2039dc1b8524d28640b8179d')


package() {
    cd "$pkgdir"
    tar xf "$srcdir/data.tar.xz"
}

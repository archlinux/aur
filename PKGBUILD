# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
# Contributor: Aron Young <tkf6fkt at gmail dot com>

pkgname=chatbox-bin
pkgver=0.5.6
pkgrel=1
pkgdesc="a cross-platform desktop client for OpenAI API, also a prompt debugging and management tool."
arch=(x86_64)
url="https://chatboxapp.xyz"
license=('GPL')
depends=('webkit2gtk' 'gtk3' 'openssl-1.1'
	cairo pango
	glib2 gcc-libs hicolor-icon-theme
	glibc gdk-pixbuf2)
provides=(chatbox)
source=("https://github.com/Bin-Huang/chatbox/releases/download/v$pkgver/chatbox_${pkgver}_amd64.deb")
sha256sums=('ccadecedc486e7d6864daca414845608d68f195a94d52862db29f1055f8f29c4')

package() {
	tar -xvpf data.tar.gz -C $pkgdir
	chown root:root -R $pkgdir
}

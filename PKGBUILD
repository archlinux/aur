# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
# Contributor: Aron Young <tkf6fkt at gmail dot com>
pkgname=chatbox-bin
pkgver=0.6.3
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
source=("https://github.com/Bin-Huang/chatbox/releases/download/v$pkgver/Chatbox-${pkgver}-amd64.deb")
sha256sums=('59ba661dacf4b034e9d25476e17e639216c028f5710b6ef1678f9ed1508a79d1')

package() {
	tar -xvpf data.tar.xz -C $pkgdir
	chown root:root -R $pkgdir
}

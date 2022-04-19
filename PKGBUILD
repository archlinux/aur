# Maintainer: lod (aur@cyber-anlage.de)

pkgname="edgetx-flasher-bin"
pkgver=0.1.0.16fb26b
pkgrel=1
pkgdesc="The new alternative to OpenTX Companion for updating radio firmware and optimizing backups"
arch=('x86_64')
url="https://edgetx.org/"
license=('Unlicense')
makedepends=()
depends=('gtk3' 'nss' 'alsa-lib')
source=("https://github.com/EdgeTX/flasher/releases/download/latest/${pkgname%%-bin}-linux-${pkgver##*.}.deb")
sha512sums=('5932ac08bc8a89bc69d38d41da8f6bcdf0558b0b29e578aaefca075f51fa6b64953ce2d4c83857450d7ea39a087cb3efc372281aac61a84f49aa21279d419081')

package() {
	tar xf data.tar.xz -C $pkgdir
	mv $pkgdir/usr/share/icons/hicolor/0x0/ $pkgdir/usr/share/icons/hicolor/512x512/
}

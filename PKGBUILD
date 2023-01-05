# Maintainer: Bink <unbound-bible-gitwfhu4sip@katink.net>

pkgname=unboundbible-bin
pkgver=5.4
pkgrel=1
epoch=
pkgdesc="An open source and a free, multilingual Bible-reader program."
arch=('i686' 'x86_64')
url="https://unboundbible.net/"
license=('GPL-3.0')
depends=('gtk2' 'sqlite')
source_x86_64=("https://github.com/vrybant/unboundbible/releases/download/v$pkgver/unboundbible_${pkgver}_amd64.deb")
sha256sums_x86_64=('3587b98f8f2f87fb54b0d952026a4e675c7b6313efc2b732742e264fc9e7ed1e')

package() {
	tar -xf data.tar.xz -C "${pkgdir}"/
	install -Dm644 "$pkgdir/usr/share/doc/unboundbible/copyright" "$pkgdir/usr/share/licenses/unboundbible/LICENSE"
}

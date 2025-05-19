# Maintainer: Johannes Janssen <0xJJ@hanni.dev>
pkgname=openbsd-keyring
pkgver=78
pkgrel=1
pkgdesc="OpenBSD signify keys."
arch=(any)
url="https://openbsd.org"
license=('custom:Unlicenseable')
optdepends=("signify: port of OpenBSD's signify")
source=("https://ftp.openbsd.org/pub/OpenBSD/signify/sigbundle-${pkgver}.tgz")
sha256sums=('0e5a12007c95c96f31ef2590ccce722fe4f2a755682e1426eaadae0aa195fb7e')

package() {
	install -Dm644 -t "$pkgdir/etc/signify/" *.pub
}

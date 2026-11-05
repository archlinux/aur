# Maintainer: Johannes Janssen <0xJJ@hanni.dev>
pkgname=openbsd-keyring
pkgver=81
pkgrel=1
pkgdesc="OpenBSD signify keys."
arch=(any)
url="https://openbsd.org"
license=('custom:Unlicenseable')
optdepends=("signify: port of OpenBSD's signify")
source=("https://ftp.openbsd.org/pub/OpenBSD/signify/sigbundle-${pkgver}.tgz")
sha256sums=('a1eff7043aa99d30ce6531535f644ec6fc1feefa9b5866684cf02a40de08945b')

package() {
	install -Dm644 -t "$pkgdir/etc/signify/" *.pub
}

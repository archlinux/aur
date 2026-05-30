# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=debian-keyring
pkgver=2026.05.24
pkgrel=1
pkgdesc="GnuPG keys for Debian (non-archive)"
arch=(any)
url=https://keyring.debian.org/
license=('GPL-2.0-or-later')
depends=(gnupg)

source=("https://httpredir.debian.org/debian/pool/main/d/debian-keyring/${pkgname}_${pkgver}_all.deb")
sha256sums=('ccb32f6530cddd9962f2273ca57bfa0af104bb091d999627c876a6cefee9b79f')

package() {
    bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}

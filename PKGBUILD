# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=debian-keyring
pkgver=2026.04.23
pkgrel=1
pkgdesc="GnuPG keys for Debian (non-archive)"
arch=(any)
url=https://keyring.debian.org/
license=('GPL-2.0-or-later')
depends=(gnupg)

source=("https://httpredir.debian.org/debian/pool/main/d/debian-keyring/${pkgname}_${pkgver}_all.deb")
sha256sums=('cae7858fad21dc8d3ddb7be6b5181e8f0ffdcae7480cfe359f4ec99a70b17e68')

package() {
    bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}

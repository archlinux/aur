# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=debian-keyring
pkgver=2026.03.25
pkgrel=1
pkgdesc="GnuPG keys for Debian (non-archive)"
arch=(any)
url=https://keyring.debian.org/
license=('GPL-2.0-or-later')
depends=(gnupg)

source=("https://httpredir.debian.org/debian/pool/main/d/debian-keyring/${pkgname}_${pkgver}_all.deb")
sha256sums=('7f48a8f7cd846f8b01d7a0fc65b1dc93c1a6d06981683b9db97e407c7908f0ae')

package() {
    bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}

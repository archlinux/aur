# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=debian-keyring
pkgver=2018.12.24
pkgrel=1
pkgdesc="GnuPG keys for Debian (non-archive)"
arch=(any)
url=http://keyring.debian.org/
license=(GPL)
depends=(gnupg)

source=("http://httpredir.debian.org/debian/pool/main/d/debian-keyring/${pkgname}_${pkgver}_all.deb")
sha256sums=('df402efd41fbaa314e48875fa5e020b7d56afa128a35e9c20bc7d629d58b68a1')

package() {
    bsdtar xvf "$srcdir/data.tar.xz" -C "$pkgdir"
}

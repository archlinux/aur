# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=debian-keyring
pkgver=2018.11.25
pkgrel=1
pkgdesc="GnuPG keys for Debian (non-archive)"
arch=(any)
url=http://keyring.debian.org/
license=(GPL)
depends=(gnupg)

source=("http://httpredir.debian.org/debian/pool/main/d/debian-keyring/${pkgname}_${pkgver}_all.deb")
sha256sums=('bffc62ab3d8b37d3b2358c8aab75a5e2682d000d3ae80c1b764c0141f138495c')

package() {
    bsdtar xvf "$srcdir/data.tar.xz" -C "$pkgdir"
}

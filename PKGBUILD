# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=debian-keyring
pkgver=2019.09.24
pkgrel=1
pkgdesc="GnuPG keys for Debian (non-archive)"
arch=(any)
url=http://keyring.debian.org/
license=(GPL)
depends=(gnupg)

source=("http://httpredir.debian.org/debian/pool/main/d/debian-keyring/${pkgname}_${pkgver}_all.deb")
sha256sums=('b17227e10aca3363a4f005d7af699df2a211c7d04923169fae4a2505a73d905d')

package() {
    bsdtar xvf "$srcdir/data.tar.xz" -C "$pkgdir"
}

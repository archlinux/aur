# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=debian-keyring
pkgver=2021.03.24
pkgrel=1
pkgdesc="GnuPG keys for Debian (non-archive)"
arch=(any)
url=https://keyring.debian.org/
license=(GPL)
depends=(gnupg)

source=("http://httpredir.debian.org/debian/pool/main/d/debian-keyring/${pkgname}_${pkgver}_all.deb")
sha256sums=('0b955b50d5d4e94bfd4d84578530f620e78938977f439f5fe883f0786b347c6c')

package() {
    bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}

# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=debian-keyring
pkgver=2024.03.24
pkgrel=1
pkgdesc="GnuPG keys for Debian (non-archive)"
arch=(any)
url=https://keyring.debian.org/
license=('GPL-2.0-or-later')
depends=(gnupg)

source=("https://httpredir.debian.org/debian/pool/main/d/debian-keyring/${pkgname}_${pkgver}_all.deb")
sha256sums=('6898c1578c46bda7af83ea12c44f420a4cfaa091d623d2afd0cea669085e91d2')

package() {
    bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
}

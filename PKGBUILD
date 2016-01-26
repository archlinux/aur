# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: max.bra <max.bra at alice dot it>
# Contributor: SeeSchloss <seeschloss@seos.fr>

pkgname=unoconv
pkgver=0.7
pkgrel=1
pkgdesc="Libreoffice-based document converter"
depends=(python libreoffice)
makedepends=(asciidoc)
arch=(any)
license=(GPL2)
url="http://dag.wieers.com/home-made/unoconv"
source=("$url/$pkgname-$pkgver.tar.gz")
sha256sums=('56abbec55632b19dcaff7d506ad6e2fd86f53afff412e622cc1e162afb1263fa')

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}

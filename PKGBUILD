# Maintainer: Alexej Magura <agm2819*gmail*>
# 
# 
pkgname=reform
pkgver=0.2.2
pkgrel=1
pkgdesc="a PKGBUILD management suite"
arch=('any')
url="https://bitbucket.org/hav3lock/pub_rel/src"
license=('GPL3')
depends=('perl' 'perl-text-diff' 'perl-config-simple')
source=("https://bitbucket.org/hav3lock/pub_rel/downloads/$pkgname-$pkgver.tar.gz")
md5sums=('216bea7c1508c2e16191d565f65cad92')

package () {

    cd "$srcdir/$pkgname-$pkgver"

    make DESTDIR="\"$pkgdir\"" install

}

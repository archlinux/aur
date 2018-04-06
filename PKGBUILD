# Maintainer: Dom Williams <aur@domwillia.ms> 

pkgname=wclatex
pkgver=1.1
pkgrel=1
pkgdesc='Simple yet fancy per-file LaTeX detexed word counting script'
arch=('any')
_url='https://github.com/DomWilliams0/wclatex'
license=('GPL')
depends=('findutils' 'texlive-bin' 'coreutils' 'gawk' 'util-linux')
source=("$pkgname-$pkgver.tar.gz::$_url/archive/v$pkgver.tar.gz")
sha256sums=('285225047cb583b4eb36639d6125860e8139c1428748183b69b834b6a7b28a72')

package() {
	install -D "$srcdir/$pkgname-$pkgver/wclatex.sh" "$pkgdir/usr/bin/wclatex"
}

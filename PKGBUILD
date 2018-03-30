# Maintainer: Dom Williams <aur@domwillia.ms> 

pkgname=wclatex
pkgver=1.0
pkgrel=1
pkgdesc='Simple yet fancy per-file LaTeX detexed word counting script'
arch=('any')
url='https://github.com/DomWilliams0/wclatex'
license=('GPL')
depends=('findutils' 'texlive-bin' 'coreutils' 'gawk' 'util-linux')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('18ee6385d3379ec41bccaeb7e0a7d2e84885e4cf03fc791db95b719198c93aeb')

package() {
	install -D "$srcdir/$pkgname-$pkgver/wclatex.sh" "$pkgdir/usr/bin/wclatex"
}

# Maintainer: Avahe Kellenberger <avahe@protonmail.ch>
pkgname='git-pair'
pkgver='1.0.3'
pkgrel='2'
pkgdesc="Pair programming tool to define co-authors in git commits."
arch=('x86_64')
url="https://github.com/avahe-kellenberger/git-pair"
license=('GPL2')
depends=('git')
makedepends=('gcc')
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('9426a1ca1a1f8f0294eae51819c04638')

build() {
    cd "$pkgname-$pkgver" 
    gcc pair.c -o "$pkgname"
}

package() {
    install -Dt "$pkgdir/usr/bin" "$pkgname-$pkgver/$pkgname"
}

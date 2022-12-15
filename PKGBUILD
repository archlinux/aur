# Maintainer: Magnus Anderson <magnus@iastate.edu>
pkgname=arch-wiki-docs-search
pkgver=1
pkgrel=2
pkgdesc='A script to search the offline version of the arch wiki'
url='https://github.com/magnus-ISU/aur-scripts/blob/master/wiki-docs-search'
arch=('any')
license=('Unlicense')
depends=('arch-wiki-docs' 'simple-http-server')
noextract=('wiki-docs-search')
source=('https://raw.githubusercontent.com/magnus-ISU/aur-scripts/master/wiki-docs-search')
md5sums=('SKIP')

package() {
    mkdir -p "$pkgdir/usr/bin/"
    install -D -m755 "$srcdir/wiki-docs-search" "$pkgdir/usr/bin/"
}

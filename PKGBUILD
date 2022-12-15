# Maintainer: Magnus Anderson <magnus@iastate.edu>
pkgname=arch-wiki-docs-search
pkgver=1
pkgrel=3
pkgdesc='A bad script to search the arch wiki - use wikiman instead'
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

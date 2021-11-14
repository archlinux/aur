# Maintainer: Magnus Anderson <magnus@iastate.edu>
pkgname=arch-wiki-docs-search
pkgver=1
pkgrel=2
pkgdesc='A script to search the offline version of the arch wiki'
arch=('any')
license=('Unlicense')
depends=('arch-wiki-docs')
noextract=('wiki-docs-search')

package() {
    mkdir -p "${pkgdir}/usr/bin/"
    install -D -m755 ../wiki-docs-search "${pkgdir}/usr/bin/"
}

# Maintainer: Magnus Anderson <magnus@iastate.edu>
pkgname=arch-wiki-docs-search
pkgver=1
pkgrel=1
pkgdesc='A script to search the offline version of the arch wiki'
arch=('any')
license=('custom:DWTFYW')
depends=('arch-wiki-docs')
noextract=('wiki-search')

package() {
    mkdir -p "${pkgdir}/usr/bin/"
    install -D -m755 ../wiki-docs-search "${pkgdir}/usr/bin/"
}

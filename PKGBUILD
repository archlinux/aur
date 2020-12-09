# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: "devzero" (Tim Rice) <t dot rice at ms dot unimelb dot edu dot au>

# otfinfo --info *.ttf

_pkgname='Humor-Sans'
pkgname="ttf-${_pkgname,,}"
pkgver=1.0
pkgrel=4
pkgdesc='xkcd styled sans-serif typeface'
arch=('any')
url='http://xkcdsucks.blogspot.com.au/2009/03/xkcdsucks-is-proud-to-present-humor.html'
license=('custom')
source=("${pkgname}-${pkgver}-${pkgrel}.ttf::https://antiyawn.com/uploads/${_pkgname}-${pkgver}.ttf"
        "${pkgname}-${pkgver}-${pkgrel}-license::https://antiyawn.com/uploads/${_pkgname}OFL-${pkgver}.txt")
sha256sums=('2ded6a27448c9ed30aaff177744e2bcf1e52e0aab018b2a8be64565df633318f'
            '94aadc8f2a4dcfbe296e7dffb165c557b8a10d9b6b9e0542f06f9fe0ef79ca83')

package() {
  install -Dvm644 "${pkgname}-${pkgver}-${pkgrel}.ttf" "${pkgdir}/usr/share/fonts/TTF/${_pkgname}.ttf"
  install -Dvm644 "${pkgname}-${pkgver}-${pkgrel}-license" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:

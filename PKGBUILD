# Maintainer: Popolon <Popolon @ popolon . org>

_pkgname=nomnatong-fonts
pkgname="${_pkgname}"
pkgver=5.18
pkgrel=1
pkgdesc="Vietnamese Nôm Preservation Foundations vietnamese Hán-Nôm script fonts"
arch=('any')
url="https://nomfoundation.org/nom-tools/Nom-Font"
license=('MIT')
source=("https://github.com/nomfoundation/font/raw/refs/heads/master/LICENSE"
        "https://github.com/nomfoundation/font/releases/download/v${pkgver}/NomNaTong-Regular.otf"
        "https://github.com/nomfoundation/font/releases/download/v${pkgver}/NomNaTong-Regular.ttf")
sha256sums=('5a96128ab441fd6df1ca8aa48a7223dfa3c4bd2c001262712373698bb24e8e72'
            '3f1697da241856101e0f684d922ed2b00b9fc0f2a9588ef92ae0eb47c90049fa'
            '37bd8506257d0905d499395e7f0bc2b6a2ae619dbb635a82ea0905b75b2ff5f3'
           )

package() {
  install -d "${pkgdir}/usr/share/fonts/${_pkgname}"
  install -Dm 0644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -m 0644 *.ttf *.otf "${pkgdir}/usr/share/fonts/${_pkgname}/"
}

# vim:set et sw=2 ts=2 tw=79:

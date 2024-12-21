# Maintainer: Popolon <Popolon @ popolon . org>

_pkgname=nomnatong-fonts
pkgname="${_pkgname}"
pkgver=5.13
pkgrel=1
pkgdesc="Vietnamese Nôm Preservation Foundations vietnamese Hán-Nôm script fonts"
arch=('any')
url="https://nomfoundation.org/nom-tools/Nom-Font"
license=('MIT')
source=("https://github.com/nomfoundation/font/raw/refs/heads/master/LICENSE"
        "https://github.com/nomfoundation/font/releases/download/v${pkgver}/NomNaTongLight.ttf"
        "https://github.com/nomfoundation/font/releases/download/v${pkgver}/NomNaTong-Regular.otf"
        "https://github.com/nomfoundation/font/releases/download/v${pkgver}/NomNaTong-Regular.ttf")
sha256sums=('5a96128ab441fd6df1ca8aa48a7223dfa3c4bd2c001262712373698bb24e8e72'
            'fed75ff06b7287a744afa160bccbb7f1c07c0b67b209e6f37db36aeb1fb54b76'
            '8275dad23809fae38bd66f9727c2f7bb0947b79d51a936c896a1a7a0246500ee'
            'c7e833daa78d7721ae19c780283c8341638db9100380a4b6fb338ec9ed7ea144'
           )

package() {
  install -d "${pkgdir}/usr/share/fonts/${_pkgname}"
  install -Dm 0644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -m 0644 *.ttf *.otf "${pkgdir}/usr/share/fonts/${_pkgname}/"
}

# vim:set et sw=2 ts=2 tw=79:

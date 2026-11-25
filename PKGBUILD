# Maintainer: Popolon <Popolon @ popolon . org>

_pkgname=nomnatong-fonts
pkgname="${_pkgname}"
pkgver=5.20
pkgrel=1
pkgdesc="Vietnamese Nôm Preservation Foundations vietnamese Hán-Nôm script fonts"
arch=('any')
url="https://nomfoundation.org/nom-tools/Nom-Font"
license=('MIT')
source=("https://github.com/nomfoundation/font/raw/refs/heads/master/LICENSE"
        "https://github.com/nomfoundation/font/releases/download/v${pkgver}/NomNaTong-Regular.otf"
        "https://github.com/nomfoundation/font/releases/download/v${pkgver}/NomNaTong-Regular.ttf")
sha256sums=('5a96128ab441fd6df1ca8aa48a7223dfa3c4bd2c001262712373698bb24e8e72'
            '272de64b2e9411076ac51b3b2e9bf776f3f8f6bc2a3720f28bde8d20404c27d5'
            '67a1a68a85566275bbbf72b3501714bbe24628e74f1762ea812a5bd3a8d606e1'
           )

package() {
  install -d "${pkgdir}/usr/share/fonts/${_pkgname}"
  install -Dm 0644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -m 0644 *.ttf *.otf "${pkgdir}/usr/share/fonts/${_pkgname}/"
}

# vim:set et sw=2 ts=2 tw=79:

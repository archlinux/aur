# Maintainer: Popolon <Popolon @ popolon . org>

_pkgname=nomnatong-fonts
pkgname="${_pkgname}"
pkgver=5.16
pkgrel=1
pkgdesc="Vietnamese Nôm Preservation Foundations vietnamese Hán-Nôm script fonts"
arch=('any')
url="https://nomfoundation.org/nom-tools/Nom-Font"
license=('MIT')
source=("https://github.com/nomfoundation/font/raw/refs/heads/master/LICENSE"
        "https://github.com/nomfoundation/font/releases/download/v${pkgver}/NomNaTong-Regular.otf"
        "https://github.com/nomfoundation/font/releases/download/v${pkgver}/NomNaTong-Regular.ttf")
sha256sums=('5a96128ab441fd6df1ca8aa48a7223dfa3c4bd2c001262712373698bb24e8e72'
            '28f4c9523324ddc601f736c8df186a21bc72c35002b5bb955db1177f16280f42'
            'c66ba3e12fed21a7e62a07884796baeeefe92d209a4a9fe53abd4b849d55de58'
           )

package() {
  install -d "${pkgdir}/usr/share/fonts/${_pkgname}"
  install -Dm 0644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -m 0644 *.ttf *.otf "${pkgdir}/usr/share/fonts/${_pkgname}/"
}

# vim:set et sw=2 ts=2 tw=79:

# Maintainer: Popolon <Popolon @ popolon . org>

_pkgname=nomnatong-fonts
pkgname="${_pkgname}"
pkgver=5.15
pkgrel=2
pkgdesc="Vietnamese Nôm Preservation Foundations vietnamese Hán-Nôm script fonts"
arch=('any')
url="https://nomfoundation.org/nom-tools/Nom-Font"
license=('MIT')
source=("https://github.com/nomfoundation/font/raw/refs/heads/master/LICENSE"
        "https://github.com/nomfoundation/font/releases/download/v${pkgver}/NomNaTong-Regular.otf"
        "https://github.com/nomfoundation/font/releases/download/v${pkgver}/NomNaTong-Regular.ttf")
sha256sums=('5a96128ab441fd6df1ca8aa48a7223dfa3c4bd2c001262712373698bb24e8e72'
            '0b0d04d11387f921c105b018162c1ca44c327a91bc53295f3d4fb74357f28aca'
            'e7612f2817aacf893cb7ad3e0ac3ec02a62f857c0c7b22aafd70d1d68f3f61d5'
           )

package() {
  install -d "${pkgdir}/usr/share/fonts/${_pkgname}"
  install -Dm 0644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -m 0644 *.ttf *.otf "${pkgdir}/usr/share/fonts/${_pkgname}/"
}

# vim:set et sw=2 ts=2 tw=79:

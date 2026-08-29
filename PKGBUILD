# Maintainer: Amiad Bareli <amiad@hatul.info>

pkgname=ttf-alef
pkgver=1.001
pkgrel=1
pkgdesc="A free multi-lingual sans-serif font designed specifically for screens"
arch=('any')
url="https://fonts.google.com/specimen/Alef"
license=('OFL-1.1')
source=("https://github.com/google/fonts/raw/main/ofl/alef/Alef-Regular.ttf"
        "https://github.com/google/fonts/raw/main/ofl/alef/Alef-Bold.ttf"
        "https://github.com/google/fonts/raw/main/ofl/alef/OFL.txt")
sha256sums=('a32adcc953ac356906901778460083dc207d4560cb586fd9ea24ec5b186969ed'
            '5dae0d7b2365288d8a34f5fb033d4278be96cef2547862cb93ceb8373e10bcf1'
            'c267a00c9476c78a2336d7b372b536885b8b24173a29ed53496f67a742c14961')

package() {
  install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF/" "${srcdir}"/*.ttf
  install -Dm644 "${srcdir}/OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

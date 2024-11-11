# Maintainer: Sohrab Behdani <behdanisohrab@riseup.net>
pkgname=arad-fonts
pkgver=1.0.1
pkgrel=1
pkgdesc="Arad - A multilingual, open-source font with 8 weights and 4 dot styles, supporting Farsi, Arabic, Kurdish, Turkish, Urdu, and Mazerouni languages"
arch=('any')
url="https://github.com/MDarvishi5124/Arad"
license=('OFL')
source=("https://github.com/MDarvishi5124/Arad/releases/download/${pkgver}v/Arad.zip")
sha256sums=('SKIP')

package() {
    install -dm755 "${pkgdir}/usr/share/fonts/TTF"

    bsdtar -xvf "${srcdir}/Arad.zip" -C "${pkgdir}/usr/share/fonts/TTF" --strip-components=3 "main/static/ttf"


    find "${pkgdir}/usr/share/fonts/TTF" -type f -exec chmod 644 {} \;
}



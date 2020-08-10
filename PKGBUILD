# Maintainer: somercet <somercet@gmail.com>
pkgname=otf-coelacanth
pkgver=2020.02.22
pkgrel=1
pkgdesc="Ben Whitmore's old-style serif font family, after Bruce Rogers' Jensonesque Centaur."
arch=('any')
url="https://fontlibrary.org/en/font/coelacanth"
license=('custom:OFL')
source=('https://fontlibrary.org/assets/downloads/coelacanth/d40b6b08e184c21574151115a61a208d/coelacanth.zip'
        'SIL-OFL.txt')
sha256sums=('6926eab323cc893b7f5c6115514421c7b8d96d23376c8181e8342219816f925c'
            '0f1af6ee05ef171e2dcc6e59021848a2af26360b769dd4563df8710884e7f980')

package() {
    install -D -m644 SIL-OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/SIL-OFL.txt"

    install -d "${pkgdir}/usr/share/fonts/OTF/"
    install -m644 Coelacanth*.otf "${pkgdir}/usr/share/fonts/OTF/"
}


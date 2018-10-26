# Maintainer: Ryan Petris <ryan@petris.net>

pkgname=tails-iso
pkgver=3.10.1
pkgrel=1
pkgdesc='The Amnesic Incognito Live System (Tails) live ISO.'
arch=('any')
url='https://tails.boum.org/'
noextract=("tails-amd64-${pkgver}.iso")
source=("http://dl.amnesia.boum.org/tails/stable/tails-amd64-${pkgver}/tails-amd64-${pkgver}.iso"
        "https://tails.boum.org/torrents/files/tails-amd64-${pkgver}.iso.sig")
sha256sums=('6c6849b2cbaba7f88779ae74c4481d0149cfcf847e2bc6082862440ec6873733'
            'SKIP')
validpgpkeys=('A490D0F4D311A4153E2BB7CADBB802B258ACD84F')

package() {
    install -D -m 0644 "tails-amd64-${pkgver}.iso" "${pkgdir}/opt/tails/tails-amd64.iso"
}

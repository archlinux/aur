# Maintainer: gardenapple <gardenapple at posteo.net>

pkgname=lbrynet-bin
pkgver=0.110.0
pkgrel=1
pkgdesc='Implementation of the LBRY Network protocols, without the desktop app'
arch=('x86_64')
url='https://lbry.tech/'
license=('MIT')
conflicts=('lbrynet' 'lbry-app-bin>=0.47.1' 'lbry-app-bin<0.47.2-2')
provides=("lbrynet=$pkgver")
source=("lbrynet-linux-$pkgver.zip::https://github.com/lbryio/lbry-sdk/releases/download/v$pkgver/lbrynet-linux.zip"
        "lbrynet-LICENSE-$pkgver::https://raw.githubusercontent.com/lbryio/lbry-sdk/v$pkgver/LICENSE")

package() {
   install -Dm755 "${srcdir}/lbrynet" -t "${pkgdir}/usr/bin/"
   install -Dm644 "${srcdir}/lbrynet-LICENSE-$pkgver" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
b2sums=('9cd01bcbe048b8390569bd4ad92a27e02c554db097c8e24c9c818b660911458904aa3cfcfa71a262848c482096baedba7338eeb47014a1e952825dc66566ae4e'
        '06b4c7851cc5ca747e9bf82bc32a4e8100653bd7195a96750252e1d55618216256caea81d2e552a6066f4465c35b74cf079c7e7d9df23d6713669cd4d6636a42')

# Maintainer: gardenapple <gardenapple at posteo.net>

pkgname=lbrynet-bin
pkgver=0.109.0
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
b2sums=('8704036aa80e481d3d06a8388ac21161991d8af83fdecb469927030fb066f4b28b067c8bbdc1fdc04bb3abe5896706ff80c9c4b6845369b363cbbf7399b16db0'
        '06b4c7851cc5ca747e9bf82bc32a4e8100653bd7195a96750252e1d55618216256caea81d2e552a6066f4465c35b74cf079c7e7d9df23d6713669cd4d6636a42')

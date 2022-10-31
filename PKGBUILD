# Maintainer: gardenapple <gardenapple at posteo.net>

pkgname=lbrynet-bin
pkgver=0.112.0
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
b2sums=('b872e7ce938536b8e6ec4df4c9296637601d7ecf29dcf091f5d406a9780d46ae6a1de92013a18f1130a8bb479325f39ce26ccc42b75e66848723dace186c928c'
        '06b4c7851cc5ca747e9bf82bc32a4e8100653bd7195a96750252e1d55618216256caea81d2e552a6066f4465c35b74cf079c7e7d9df23d6713669cd4d6636a42')

# Maintainer: gardenapple <mailbox@appl.garden>

pkgname=lbrynet-bin
pkgver=0.113.0
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
b2sums=('2d6e4632bc67ced3e54cb39dccd74895e49feed38364c0d91d3b26d7fcf67cf8944af28ed3c90afdc472c7d9859d3cfe1663ba010b2b0818f4c1853dbb94dc1c'
        '06b4c7851cc5ca747e9bf82bc32a4e8100653bd7195a96750252e1d55618216256caea81d2e552a6066f4465c35b74cf079c7e7d9df23d6713669cd4d6636a42')

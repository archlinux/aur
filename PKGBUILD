# Maintainer: Segmentation Violator segmentationviolator@proton.me 

pkgname=crossgrub-grub-theme
pkgver=1.0.0
pkgrel=1
pkgdesc="Grub theme based on the CrossCode title screen"
arch=(any)
url=https://github.com/krypciak/crossgrub
depends=(grub)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/krypciak/crossgrub/releases/download/${pkgver}/crossgrub.tar.gz")
noextract=("${source[@]##*/}")
sha256sums=(e0e7678c132b8459378046e91d8bb34239abaa143620ba3a1de2847959b6620a)

package() {
    install -dm 755 "$pkgdir/boot/grub/themes/crossgrub"
    cp -r --no-preserve=ownership crossgrub "$pkgdir/boot/grub/themes/"
}

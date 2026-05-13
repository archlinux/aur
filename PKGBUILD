# Maintainer: Uami-11 <nirwan.m.9618@gmail.com>
pkgname=see-grub-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="see-grub is a renderer for grub theme.txts made with Go and Ebitengine"
arch=('x86_64')
url="https://github.com/Uami-11/see-grub"
license=('MIT')
provides=('see-grub')
conflicts=('see-grub')
source=("see-grub-${pkgver}.tar.gz::https://github.com/Uami-11/see-grub/releases/download/v${pkgver}/see-grub_Linux_x86_64.tar.gz")
sha256sums=('ef29feab22c5a1b1105f94c605fcc903b48e2fd09353c87a84d8008bef0d9815')

package() {
    install -Dm755 see-grub "${pkgdir}/usr/bin/see-grub"
}

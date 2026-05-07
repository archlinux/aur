# Maintainer: sunghyun
pkgname=rhwp-bin
pkgver=0.7.10
pkgrel=1
pkgdesc="HWP (Hangul Word Processor) viewer and editor"
arch=('x86_64')
url="https://github.com/edwardkim/rhwp"
license=('MIT')
provides=('rhwp')
conflicts=('rhwp')

source=("rhwp-v${pkgver}-linux-x86_64.tar.gz::https://github.com/edwardkim/rhwp/releases/download/v${pkgver}/rhwp-v${pkgver}-linux-x86_64.tar.gz")
sha256sums=('f5762d8beec06dcb33d92a416a0c53fb81cb8fa788516ba25046245c2202e09c')

package() {
    install -Dm755 rhwp/rhwp "$pkgdir/usr/bin/rhwp"
}

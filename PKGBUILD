# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=github-release-bin
pkgver=0.6.2
pkgrel=2
pkgdesc="Command-line app to create and edit releases on GitHub (and upload artifacts)"
arch=('x86_64')
url="https://github.com/aktau/github-release"
license=('MIT')
conflicts=('github-release')
source=("${url}/releases/download/v${pkgver}/linux-amd64-github-release.tar.bz2"
"LICENSE")
sha512sums=('d2182c166c6dd47894d660e603e9bf749752e064b896ebd9ccd73a6359a9cec518f8542cb5abf4dd5b7855c28434b1f85aa3dcaec76ed94d817e4a2db0dd742f'
            '878e698c6e40151853ab584e9004bac95335a5230789a4e6f92283f9734d4e6d3c2d676e71c359657ea15be9d3dddc65c44a88c5a48f5cf43dbd2f9df09d1ceb')

package() {
  install -Dm755 $srcdir/bin/linux/amd64/github-release \
    "${pkgdir}/usr/bin/github-release"

  install -Dm755 $srcdir/LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

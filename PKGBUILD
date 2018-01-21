# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=github-release-bin
pkgver=0.7.2
pkgrel=1
pkgdesc="Command-line app to create and edit releases on GitHub (and upload artifacts) — built from pre-compiled binary."
arch=('x86_64')
url="https://github.com/aktau/github-release"
license=('MIT')
conflicts=('github-release')
source=("${url}/releases/download/v${pkgver}/linux-amd64-github-release.tar.bz2"
"LICENSE")
sha512sums=('16515e89c8419075c7c88df5cdaac63aa798f539a33107809adbde76e002ac0732f4732159d093e287878b956c650e90cd0fa94d4836ebcf7cd19599e1d238c3'
            '878e698c6e40151853ab584e9004bac95335a5230789a4e6f92283f9734d4e6d3c2d676e71c359657ea15be9d3dddc65c44a88c5a48f5cf43dbd2f9df09d1ceb')

package() {
  install -Dm755 $srcdir/bin/linux/amd64/github-release \
    "${pkgdir}/usr/bin/github-release"

  install -Dm755 $srcdir/LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

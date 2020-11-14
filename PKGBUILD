# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=pacwatch
pkgver=0.2.2
pkgrel=1
pkgdesc='A utility which helps you watch important package updates in pacman'
arch=('any')
url="https://github.com/ouuan/pacwatch"
license=('Apache')
depends=(
  'python-yaml'
  'python-appdirs'
  'python-termcolor'
)
source=("https://github.com/ouuan/pacwatch/raw/$pkgver/pacwatch.py")
sha256sums=(8241e2990613fe946dc5151bc8b46cc54fb11cb4cff0d9c1acf3128ab7a97538)

package() {
    install -Dm755 pacwatch.py "$pkgdir"/usr/bin/$pkgname
}

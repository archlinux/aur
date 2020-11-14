# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=pacwatch
pkgver=0.2.3
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
sha256sums=(d032c2b5d40a5ca92ada4f92937aefa925877c5449d4f7ac72d3d83c2221c3b9)

package() {
    install -Dm755 pacwatch.py "$pkgdir"/usr/bin/$pkgname
}

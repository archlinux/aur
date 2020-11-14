# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=pacwatch
pkgver=0.2.1
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
sha256sums=(88ef9d9d996a45016ec3efe835fded332cedfa400a8cf149f5421b2b77585f7e)

package() {
    install -Dm755 pacwatch.py "$pkgdir"/usr/bin/$pkgname
}

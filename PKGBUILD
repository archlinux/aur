# Maintainer: Stepan Shabalin <stomperhomp@gmail.com>
pkgname=yin-yang-git
pkgver=2.0
pkgrel=1
pkgdesc="Automatic light -> dark and vice versa theme switcher for KDE Plasma."
arch=('any')
url="https://github.com/daehruoydeef/${pkgname%-git}"
license=("MIT")
makedepends=()
depends=("python>=3" "python-qtpy" "python-pyqt5")
provides=("yin-yang")
source=("git+https://github.com/daehruoydeef/${pkgname%-git}.git")
md5sums=("SKIP")

package() {
  cd "${pkgname%-git}"
  mkdir -p "$pkgdir/opt/yin-yang"
  cp -r ./* "$pkgdir/opt/yin-yang"
  mkdir -p $pkgdir/usr/bin
  cp ./bin/yin-yang "$pkgdir/usr/bin"
  # TODO: add .desktop file
}

# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=meson-ui
pkgver=0.20.1
pkgrel=1
arch=('x86_64')
pkgdesc='Qt GUI for the Meson build system'
url='https://github.com/michaelbrockus/meson-ui'
license=('Apache')
depends=('python-pyqt5' 'meson' 'ninja')
makedepends=('python-pip')

package(){
  PIP_CONFIG_FILE=/dev/null python -m pip install --isolated --root="$pkgdir" --ignore-installed --no-deps --no-warn-script-location meson-ui==$pkgver
}

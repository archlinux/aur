# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=mini-system-monitor
pkgver=1.7.1
pkgrel=1
pkgdesc="Mini version of 'System Monitoring Center'"
url="https://github.com/hakandundar34coding/mini-system-monitor"
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=('cairo' 'python-pillow' 'tk')
makedepends=('git')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd $pkgname
  python setup.py build
}

package() {
  cd $pkgname
  python setup.py install --optimize=1 --root="$pkgdir"
}

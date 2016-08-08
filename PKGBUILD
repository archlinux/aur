# Maintainer: Dor Askayo <dor.askayo@gmail.com>

pkgname=steamrun
pkgver=0.1.0
pkgrel=1
pkgdesc='A simple script for executing programs in the Steam Runtime'
arch=('any')
url='https://github.com/doraskayo/steamrun'
license=('MIT')
depends=('steam')
source=("https://github.com/doraskayo/steamrun/archive/${pkgver}.tar.gz")
sha256sums=('4f71118c53d0a2d85d91218587261cfa32036a93c575c6a5a3695e5987369512')

package() {
  cd "$srcdir/steamrun-$pkgver"

  # Install the script
  install -D "$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Install the license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

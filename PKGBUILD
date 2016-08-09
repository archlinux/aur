# Maintainer: Dor Askayo <dor.askayo@gmail.com>

pkgname=steamrun
pkgver=0.2.0
pkgrel=1
pkgdesc='A simple script for executing programs in the Steam Runtime'
arch=(i686 x86_64)
url='https://github.com/doraskayo/steamrun'
license=('MIT')
depends=(gcc-libs
         libxcb
         libgpg-error
         steam)
source=("https://github.com/doraskayo/steamrun/archive/${pkgver}.tar.gz")
sha256sums=('5e5b20e34a0a4faa05ede663b071531ecd6c893e689510034049630a27e5a940')

package() {
  cd "$srcdir/steamrun-$pkgver"

  # Install the script
  install -D "$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Install the license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

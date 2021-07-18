# Maintainer: Nicolas Marier <aur at nmarier dot com>
pkgname=venv-wrapper-bin
pkgver=2.0.0
pkgrel=1
pkgdesc='Simple python virtual environment management'
url='https://github.com/marier-nico/venv-wrapper'
source=("$pkgname-$pkgver::https://github.com/marier-nico/venv-wrapper/releases/download/v$pkgver/venv-wrapper")
noextract=("$pkgname-$pkgver")
arch=('x86_64')
license=('Apache')
depends=()
optdepends=()
conflicts=('venv-wrapper-bin')
provides=('venv-wrapper-bin')
sha256sums=('90b0d751ea5acec8f8bfb7e9d88ccf75e781c7cd91a5fbdd0040e09782873e52')

package() {
  cd "$srcdir/"

  install -Dm755 $pkgname-$pkgver "${pkgdir}/usr/bin/venv-wrapper"
}

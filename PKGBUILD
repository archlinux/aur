# Maintainer: Nicolas Marier <aur at nmarier dot com>
pkgname=venv-wrapper-bin
pkgver=0.1.5
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
sha256sums=('13759d88eb05637c9e011a090afc8105ca59054910d89fd05e7fd7ec007e98cd')

package() {
  cd "$srcdir/"

  install -Dm755 $pkgname-$pkgver "${pkgdir}/usr/bin/venv-wrapper"
}

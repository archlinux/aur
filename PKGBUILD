# Maintainer: Nicolas Marier <aur at nmarier dot com>
pkgname=venv-wrapper-bin
pkgver=2.0.2
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
sha256sums=('900c9a8807f6d06d65c390d9158e604777fd09abe66229d4c9d45dda36676fb6')

package() {
  cd "$srcdir/"

  install -Dm755 $pkgname-$pkgver "${pkgdir}/usr/bin/venv-wrapper"
}

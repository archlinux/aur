# Maintainer: Nicolas Marier <aur at nmarier dot com>
pkgname=venv-wrapper-bin
pkgver=2.0.1
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
sha256sums=('baff71a186c6d2f52df4a0868dc48e6e5c2355099397856c1846589fc265861a')

package() {
  cd "$srcdir/"

  install -Dm755 $pkgname-$pkgver "${pkgdir}/usr/bin/venv-wrapper"
}

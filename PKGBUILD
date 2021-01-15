# Maintainer: Nicolas Marier <aur at nmarier dot com>
pkgname=venv-wrapper-bin
pkgver=0.1.4
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
sha256sums=('3620c09bbbe01a51155d441144aaa1ca26d9b757f0f966452cb7d65fb28a4899')

package() {
  cd "$srcdir/"

  install -Dm755 $pkgname-$pkgver "${pkgdir}/usr/bin/venv-wrapper"
}

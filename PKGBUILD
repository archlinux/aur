# Maintainer: dmsh <dmsh.public.contact@gmail.com>

pkgname=nsz2nsp
pkgver=1.0
pkgrel=1
pkgdesc="Helper script for 'nsz' to convert packages recursive"
arch=('x86_64')
url=""
license=('Custom')
depends=('nsz')
makedepends=()
provides=("${pkgname}")
conflicts=("${pkgname}")
pkgbase=nsz2nsp

source=("nsz2nsp")
sha256sums=('b719af360405d3baa8817cbcb3d25412822ad803e8ff66159abe1233c5d45290')

package() {
  mkdir -p "${pkgdir}/usr/bin/"
  install -Dm755 ./nsz2nsp "${pkgdir}/usr/bin/"
}

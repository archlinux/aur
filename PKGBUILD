# Maintainer: Benjamin Levy <blevy@protonmail.com>
pkgname=pwninit-bin
pkgver=2.1.0
pkgrel=3
provides=('pwninit')
conflicts=('pwninit')
depends=('elfutils')
arch=('x86_64')
pkgdesc="pwninit - automate starting binary exploit challenges. Pre-compiled."
license=('MIT')
url="https://github.com/io12/pwninit"
source=("${pkgname}-${pkgver}::https://github.com/io12/pwninit/releases/download/${pkgver}/pwninit")
md5sums=('7bbf9be8f4329307d39ce30192578199')

package() {
  install -Dm 755 "${pkgname}-${pkgver}" -T "${pkgdir}/usr/bin/pwninit"
}

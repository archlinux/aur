# Maintainer: Benjamin Levy <blevy@protonmail.com>
pkgname=pwninit-bin
pkgver=2.1.3
pkgrel=0
provides=('pwninit')
conflicts=('pwninit')
depends=('elfutils')
arch=('x86_64')
pkgdesc="pwninit - automate starting binary exploit challenges. Pre-compiled."
license=('MIT')
url="https://github.com/io12/pwninit"
source=("${pkgname}-${pkgver}::https://github.com/io12/pwninit/releases/download/${pkgver}/pwninit")
md5sums=('f953d4f52dd1244d98dc6115d447c59f')

package() {
  install -Dm 755 "${pkgname}-${pkgver}" -T "${pkgdir}/usr/bin/pwninit"
}

# Maintainer: Benjamin Levy <blevy@protonmail.com>
pkgname=pwninit-bin
pkgver=2.1.4
pkgrel=0
provides=('pwninit')
conflicts=('pwninit')
depends=('elfutils')
arch=('x86_64')
pkgdesc="pwninit - automate starting binary exploit challenges. Pre-compiled."
license=('MIT')
url="https://github.com/io12/pwninit"
source=("${pkgname}-${pkgver}::https://github.com/io12/pwninit/releases/download/${pkgver}/pwninit")
md5sums=('14ab0a95a15646fec8f3b7c318c59b5c')

package() {
  install -Dm 755 "${pkgname}-${pkgver}" -T "${pkgdir}/usr/bin/pwninit"
}

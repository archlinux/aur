# Maintainer: Benjamin Levy <blevy@protonmail.com>
pkgname=pwninit-bin
pkgver=2.2.0
pkgrel=0
provides=('pwninit')
conflicts=('pwninit')
depends=('elfutils')
arch=('x86_64')
pkgdesc="pwninit - automate starting binary exploit challenges. Pre-compiled."
license=('MIT')
url="https://github.com/io12/pwninit"
source=("${pkgname}-${pkgver}::https://github.com/io12/pwninit/releases/download/${pkgver}/pwninit")
sha256sums=('ac2984416f41790367759bb4c0f2a10653d7b4a31264291f71ab3199a321795e')

package() {
  install -Dm 755 "${pkgname}-${pkgver}" -T "${pkgdir}/usr/bin/pwninit"
}

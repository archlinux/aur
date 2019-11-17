# Maintainer: Benjamin Levy <blevy@protonmail.com>
pkgname=pwninit-bin
pkgver=1.2.1
pkgrel=1
depends=('elfutils')
arch=('x86_64')
pkgdesc="pwninit - automate starting binary exploit challenges"
license=('MIT')
url="https://github.com/io12/pwninit"
source=("https://github.com/io12/pwninit/releases/download/${pkgver}/pwninit")
md5sums=('5e2779c87e9548f8fc434917859b8edd')

package() {
  install -Dm 755 pwninit -t "${pkgdir}/usr/bin"
}

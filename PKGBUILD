# Maintainer: Benjamin Levy <blevy@protonmail.com>
pkgname=pwninit-bin
pkgver=2.0.1
pkgrel=1
provides=('pwninit')
conflicts=('pwninit')
depends=('elfutils')
arch=('x86_64')
pkgdesc="pwninit - automate starting binary exploit challenges. Pre-compiled."
license=('MIT')
url="https://github.com/io12/pwninit"
source=("https://github.com/io12/pwninit/releases/download/${pkgver}/pwninit")
md5sums=('708a4eb80ac07d2ca57c391ac312342c')

package() {
  install -Dm 755 pwninit -t "${pkgdir}/usr/bin"
}

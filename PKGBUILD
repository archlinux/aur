# Maintainer: Jakub "Kubuxu" Sztandera  <kubuxu@protonmail.ch>
# vim: set expandtab ts=2 sw=2:

pkgname=gx-go
pkgver=1.4.0
pkgrel=1

pkgdesc="A tool to use with the gx package manager for packages written in go."
url="https://github.com/whyrusleeping/$pkgname"
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')

depends=('glibc')
optdepends=()
makedepends=()

_srcroot="https://ipfs.io/ipns/dist.ipfs.io"
source_x86_64=("$_srcroot/$pkgname/v$pkgver/${pkgname}_v${pkgver}_linux-amd64.tar.gz")
source_i686=("$_srcroot/$pkgname/v$pkgver/${pkgname}_v${pkgver}_linux-386.tar.gz")
source_armv7h=("$_srcroot/$pkgname/v$pkgver/${pkgname}_v${pkgver}_linux-arm.tar.gz")

sha512sums_i686=('b15942da2e5408c5f1048f3a4163afca7efbadbe90fb0eec329cd107cf2d4eb4a4506edcd3b5cffccafd113f2dd0c23019ccb45f1ecf47a3fd8ef9317d53321a')
sha512sums_x86_64=('c657e8855c362149893da441f1e1592f6ca8e6b84cefe5bebd3a41140148e52dacc0cfc0a933629d0e5fbf257009afa6014d9a0ef0fca33452d8be03b8adf6e9')
sha512sums_armv7h=('bed1059577f0bdf2a047850978293fb00e4dacf932cf6a515b35fe5f8cef2281fecc8de4da34cf8f678730146b2079e5de4cfc9069091b1e2ee47a4011931153')

package() {
  install -Dm 755 ${pkgname}/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}

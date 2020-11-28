# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=luna-manager
pkgver=latest
pkgrel=1
pkgdesc="Luna-lang package manager"
arch=('x86_64')
url='https://luna-lang.org'
license=('Apache')
depends=('zlib' 'gmp')
source=("luna-manager-${pkgver}::https://s3-us-west-2.amazonaws.com/packages-luna/linux/luna-manager")
sha256sums=('SKIP')

package() {
  install -Dm755 luna-manager-${pkgver} "${pkgdir}/usr/bin/${pkgname}"
}

# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=luna-manager
pkgver=1.1.1
pkgrel=1
pkgdesc="Luna-lang package manager (alpha)"
arch=('x86_64')
url='https://luna-lang.org'
license=('Apache')
depends=('zlib' 'gmp')
source=("luna-manager-${pkgver}::https://s3-us-west-2.amazonaws.com/packages-luna/linux/luna-manager")
sha256sums=('a992d40dc2472a2b2efa7ea6e7cefd87492852a9e5f62fec7272dc302111580b')

package() {
  install -Dm755 luna-manager-${pkgver} "${pkgdir}/usr/bin/${pkgname}"
}
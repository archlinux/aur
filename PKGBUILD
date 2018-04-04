pkgname=ttcp
pkgver=20071201
pkgrel=2
pkgdesc="TCP benchmarking tool"
arch=('i686' 'x86_64')
license=('custom:Public Domain')
depends=('glibc')
makedepends=('gcc')
source=("http://www.netcore.fi/pekkas/linux/ipv6/ttcp.c")
build() {
  cd "${srcdir}"
  gcc ttcp.c -o ttcp
}

package() {
  cd "${srcdir}"
  install -D -m755 ttcp "${pkgdir}/usr/bin/ttcp"
}
md5sums=('2f6ffb3e9132f4815c3ade3bd1dba99b')
sha256sums=('52f438ef4f57ddbdd1e0dcd77efeffbdf10e59ff09279cff2fcc717803536612')

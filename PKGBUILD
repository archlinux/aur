pkgname=cdpr-lldp
pkgver=3.0.4
pkgrel=2
pkgdesc="A fork of CDPR to decode CDP and LLDP packets"
url="https://github.com/tdorssers/cdpr-3.0"
license=('GPL')
arch=('i686' 'x86_64')
depends=('libpcap')
source=('cdpr-lldp.tar.gz::https://github.com/tdorssers/cdpr-3.0/tarball/567584c4763dac8c4662820ca06fe9745d025992')
md5sums=('5e9e7d063a9b0758c8121b1d0de702f2')

build() {
  cd "${srcdir}/tdorssers-cdpr-3.0-567584c"
  make
}

package() {
  cd "${srcdir}/tdorssers-cdpr-3.0-567584c"
  install -D -m 0755 "${srcdir}/tdorssers-cdpr-3.0-567584c/cdpr" "${pkgdir}/usr/bin/cdpr"
}

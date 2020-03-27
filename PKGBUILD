# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=rustbuster-bin
pkgver=3.0.3
pkgrel=1
pkgdesc='A Comprehensive Web Fuzzer and Content Discovery Tool'
arch=('x86_64')
url="https://github.com/phra/rustbuster"
license=('GPL-3.0')
provides=('rustbuster')
source=("${url}/releases/download/v${pkgver}/rustbuster-v${pkgver}-x86_64-unknown-linux-gnu")
md5sums=('f24e04242b63a698a7d9caef94243986')

package() {
  install -Dm755 ${srcdir}/rustbuster* "${pkgdir}/usr/bin/rustbuster"
}
# vim:set ts=2 sw=2 et:
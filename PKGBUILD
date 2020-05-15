# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=rustbuster-bin
pkgver=3.0.3
pkgrel=1
pkgdesc='A Comprehensive Web Fuzzer and Content Discovery Tool'
arch=('x86_64')
url="https://github.com/phra/rustbuster"
license=('GPL3')
depends=('openssl')
provides=('rustbuster')
source=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/rustbuster-v${pkgver}-x86_64-unknown-linux-gnu")
sha256sums=('3f790029bfe4350bd994153465c81beedc54d61c1dadeda124108bf875459574')

package() {
  install -Dm755 ${srcdir}/rustbuster* "${pkgdir}/usr/bin/rustbuster"
}
# vim:set ts=2 sw=2 et:
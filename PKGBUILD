# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=kondo-bin
pkgver=0.3
pkgrel=1
pkgdesc='Save disk space by cleaning unneeded files from software projects'
arch=('x86_64')
url="https://github.com/tbillington/kondo"
license=('MIT')
provides=('kondo')
source=("${url}/releases/download/v${pkgver}/kondo-x86_64-unknown-linux-gnu.tar.gz")
md5sums=('f93cfc72a9f29a7dcf22be5949b208fa')

package() {
  install -Dm755 ${srcdir}/kondo "${pkgdir}/usr/bin/kondo"
}
# vim:set ts=2 sw=2 et:
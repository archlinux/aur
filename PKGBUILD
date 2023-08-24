# Maintainer: m0ar < edvard [at] hubinette dot me>

pkgname='bacalhau-bin'
pkgver='1.0.3'
pkgrel=1
pkgdesc='Compute over Data framework for public, transparent, and optionally verifiable computation'
arch=('x86_64')
url='https://www.bacalhau.org/'
license=('APACHE')
source=(
  "https://github.com/bacalhau-project/bacalhau/releases/download/v${pkgver}/bacalhau_v${pkgver}_linux_amd64.tar.gz"
)
md5sums=('2ae9d546475d10b4dc7cc0698ec3bab3')

package() {
  install -D bacalhau "$pkgdir/usr/bin/bacalhau"
}

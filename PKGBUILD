# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=s3gof3r-bin
pkgver=0.5.0
pkgrel=1
pkgdesc='Fast, concurrent, streaming access to Amazon S3, including gof3r, a CLI'
arch=('x86_64')
url="http://godoc.org/github.com/rlmcpherson/s3gof3r"
license=('MIT')
provides=('s3gof3r')
source=("https://github.com/rlmcpherson/s3gof3r/releases/download/v${pkgver}/gof3r_${pkgver}_linux_amd64.tar.gz")
sha256sums=('d88f199d1580d8c8cac26ba39e15dc6e2126d20e56c3894bd37a226e8b3e665c')

package() {
  install -Dm755 "${srcdir}/gof3r_${pkgver}_linux_amd64/gof3r" -t "${pkgdir}/usr/bin"
}
# vim:set ts=2 sw=2 et:
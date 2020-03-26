# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=s3find-bin
pkgver=0.6.0
pkgrel=1
pkgdesc='A command line utility to walk an Amazon S3 hierarchy, an analog of find for Amazon S3'
arch=('x86_64')
url="https://github.com/AnderEnder/s3find-rs"
license=('BSD-2-Clause')
provides=('s3find' 's3find-rs')
source=("${url}/releases/download/v${pkgver}/s3find-x86_64-linux.tar.gz")
md5sums=('de0dcb11bba9eadfce9e8af8ec81008f')

package() {
  cd "${srcdir}"
  install -Dm755 s3find "${pkgdir}/usr/bin/s3find"
}
# vim:set ts=2 sw=2 et:
# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=s3find-bin
pkgver=0.7.2
pkgrel=1
pkgdesc='A command line utility to walk an Amazon S3 hierarchy, an analog of find for Amazon S3'
arch=('x86_64')
url="https://github.com/AnderEnder/s3find-rs"
license=('BSD')
provides=('s3find' 's3find-rs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/s3find-x86_64-linux.tar.gz"
        'LICENSE::https://github.com/AnderEnder/s3find-rs/raw/master/LICENSE')
sha256sums=('72eeced3b57b656b901148b196138905afb04b1e08abcf492b1f0c39cc2f671e'
            '6fbc2783a865b0be78dedbd32ded7076d9aa222cf4bc8970cee2c7738e55caaf')

package() {
  install -Dm755 "${srcdir}"/s3find "${pkgdir}/usr/bin/s3find"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

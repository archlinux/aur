# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=s3-edit-bin
pkgver=0.0.13
pkgrel=1
pkgdesc='Edit directly a file on Amazon S3 in CLI'
arch=('x86_64')
url="https://github.com/tsub/s3-edit"
license=('MIT')
provides=('s3-edit')
source=("${url}/releases/download/v${pkgver}/s3-edit_${pkgver}_linux_amd64.tar.gz")
md5sums=('e6717f9c2c905f376d6450fad4979d33')

package() {
	install -Dm755 "${srcdir}"/s3-edit "${pkgdir}/usr/bin/s3-edit"
	install -Dm644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/s3-edit/LICENSE"
}
# vim:set ts=2 sw=2 et:
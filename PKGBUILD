# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: E5ten <e5ten.arch@gmail.com>

pkgname=yq2-bin
pkgver=4.2.1
pkgrel=1
pkgdesc='a portable command-line YAML processor'
arch=('x86_64')
url='https://github.com/mikefarah/yq'
_github_url="https://github.com/mikefarah/yq"
license=('MIT')
provides=('yq')
conflicts=('yq')
source=("yq-${pkgver}::https://github.com/mikefarah/yq/releases/download/v${pkgver}/yq_linux_amd64")
sha256sums=('51018dedf4cb510c7cf6c42663327605e7e0c315747fe584fbf83cc10747449c')

package() {
	install -Dm755 "${srcdir}/yq-${pkgver}" "${pkgdir}/usr/bin/yq"
}

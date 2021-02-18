# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: E5ten <e5ten.arch@gmail.com>

pkgname=yq2-bin
pkgver=4.6.0
pkgrel=1
pkgdesc='a portable command-line YAML processor'
arch=('x86_64')
url='https://github.com/mikefarah/yq'
_github_url="https://github.com/mikefarah/yq"
license=('MIT')
provides=('yq')
conflicts=('yq')
source=("yq-${pkgver}::https://github.com/mikefarah/yq/releases/download/v${pkgver}/yq_linux_amd64")
sha256sums=('3cd45de096cc3c5fcff3ba4b3fbc10cd2ad606c670b626b51f60ca66b7ddcd9a')

package() {
	install -Dm755 "${srcdir}/yq-${pkgver}" "${pkgdir}/usr/bin/yq"
}

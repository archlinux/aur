# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: E5ten <e5ten.arch@gmail.com>

pkgname=yq2-bin
pkgver=4.4.0
pkgrel=1
pkgdesc='a portable command-line YAML processor'
arch=('x86_64')
url='https://github.com/mikefarah/yq'
_github_url="https://github.com/mikefarah/yq"
license=('MIT')
provides=('yq')
conflicts=('yq')
source=("yq-${pkgver}::https://github.com/mikefarah/yq/releases/download/v${pkgver}/yq_linux_amd64")
sha256sums=('9d9d106b849b8d7c17a3e794adce902f9cd2fe9f2fa33e4351474f4a5950bc11')

package() {
	install -Dm755 "${srcdir}/yq-${pkgver}" "${pkgdir}/usr/bin/yq"
}

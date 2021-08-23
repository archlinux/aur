# Maintainer: Alexis BRENON <brenon.alexis+arch at gmail dot com>
# Contributor: Matthew McGinn <mamcgi@gmail.com>
# Contributor: E5ten <e5ten.arch@gmail.com>

pkgname=yq2-bin
pkgver=4.12.0
pkgrel=1
pkgdesc='A lightweight and portable command-line YAML processor'
arch=('x86_64')
url='https://github.com/mikefarah/yq'
license=('MIT')
provides=('yq')
conflicts=('yq')
source=("yq-${pkgver}::${url}/releases/download/v${pkgver}/yq_linux_amd64")
sha256sums=('8716766cb49ab9dd7df5622d80bb217b94a21d0f3d3dc3d074c3ec7a0c7f67ea')

package() {
	install -Dm755 "${srcdir}/yq-${pkgver}" "${pkgdir}/usr/bin/yq"
}

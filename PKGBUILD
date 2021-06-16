# Maintainer: Alexis BRENON <brenon.alexis+arch at gmail dot com>
# Contributor: Matthew McGinn <mamcgi@gmail.com>
# Contributor: E5ten <e5ten.arch@gmail.com>

pkgname=yq2-bin
pkgver=4.9.6
pkgrel=1
pkgdesc='A lightweight and portable command-line YAML processor'
arch=('x86_64')
url='https://github.com/mikefarah/yq'
license=('MIT')
provides=('yq')
conflicts=('yq')
source=("yq-${pkgver}::${url}/releases/download/v${pkgver}/yq_linux_amd64")
sha256sums=('a1cfa39a9538e27f11066aa5659b32f9beae1eea93369d395bf45bcfc8a181dc')

package() {
	install -Dm755 "${srcdir}/yq-${pkgver}" "${pkgdir}/usr/bin/yq"
}

# Maintainer: Alexis BRENON <brenon.alexis+arch at gmail dot com>
# Contributor: Matthew McGinn <mamcgi@gmail.com>
# Contributor: E5ten <e5ten.arch@gmail.com>

pkgname=yq2-bin
pkgver=4.11.2
pkgrel=1
pkgdesc='A lightweight and portable command-line YAML processor'
arch=('x86_64')
url='https://github.com/mikefarah/yq'
license=('MIT')
provides=('yq')
conflicts=('yq')
source=("yq-${pkgver}::${url}/releases/download/v${pkgver}/yq_linux_amd64")
sha256sums=('6b891fd5bb13820b2f6c1027b613220a690ce0ef4fc2b6c76ec5f643d5535e61')

package() {
	install -Dm755 "${srcdir}/yq-${pkgver}" "${pkgdir}/usr/bin/yq"
}

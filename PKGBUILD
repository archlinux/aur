# Maintainer: Alexis BRENON <brenon.alexis+arch at gmail dot com>
# Contributor: Matthew McGinn <mamcgi@gmail.com>
# Contributor: E5ten <e5ten.arch@gmail.com>

pkgname=yq2-bin
pkgver=4.13.3
pkgrel=1
pkgdesc='A lightweight and portable command-line YAML processor'
arch=('x86_64')
url='https://github.com/mikefarah/yq'
license=('MIT')
provides=('yq')
conflicts=('yq')
source=("yq-${pkgver}::${url}/releases/download/v${pkgver}/yq_linux_amd64")
sha256sums=('32f2b8b11bcf0c1f5abedcb15d8e5f401ead9a44faffbcb009505f2af5f07315')

package() {
	install -Dm755 "${srcdir}/yq-${pkgver}" "${pkgdir}/usr/bin/yq"
}

# Maintainer: Alexis BRENON <brenon.alexis+arch at gmail dot com>
# Contributor: Matthew McGinn <mamcgi@gmail.com>
# Contributor: E5ten <e5ten.arch@gmail.com>

pkgname=yq2-bin
pkgver=4.11.1
pkgrel=1
pkgdesc='A lightweight and portable command-line YAML processor'
arch=('x86_64')
url='https://github.com/mikefarah/yq'
license=('MIT')
provides=('yq')
conflicts=('yq')
source=("yq-${pkgver}::${url}/releases/download/v${pkgver}/yq_linux_amd64")
sha256sums=('1f63c9fe412c0d17b263e0ccfd91a596bb359db69ef7dddf5f53af1b2e8db898')

package() {
	install -Dm755 "${srcdir}/yq-${pkgver}" "${pkgdir}/usr/bin/yq"
}

# Maintainer: Louis Kleiver <louis.kleiver@gmail.com>
pkgname=blihbetter
pkgver=2.3.0
pkgrel=1
pkgdesc="A simple python script to simplify BLIH usage for Epitech students."
arch=('any')
url="https://github.com/mrCaelum/blihbetter"
license=('MIT')
depends=('python>=3.3.0'
	'python-requests'
	'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mrCaelum/${pkgname}/releases/latest/download/v${pkgver}.tar.gz")
sha256sums=("9c2b190e324f2f6bde4ed24db1b85fe2013946db927d33e280ef0daf1c8120a8")

build() {
	mv "${pkgname}.py" "${pkgname}"
	chmod 755 "${pkgname}"
}

package() {
	mkdir -p "${pkgdir}/usr/bin"
	cp -a "${pkgname}" "${pkgdir}/usr/bin"
}

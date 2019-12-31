# Maintainer: Louis Kleiver <louis.kleiver@gmail.com>
pkgname=eiota
pkgver=2.1.0
pkgrel=1
pkgdesc="A simple python script to simplify BLIH usage for Epitech students."
arch=('any')
url="https://github.com/mrCaelum/eiota"
license=('MIT')
depends=('python>=3.3.0'
	'python-requests'
	'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mrCaelum/${pkgname}/releases/latest/download/v${pkgver}.tar.gz")
sha256sums=("57c6b405904f92c84dcc82e9cb8d31bf8230af1c7f9951a3bccf2604c193fc2f")

build() {
	mv "${pkgname}.py" "${pkgname}"
	chmod 755 "${pkgname}"
}

package() {
	mkdir -p "${pkgdir}/usr/bin"
	cp -a "${pkgname}" "${pkgdir}/usr/bin"
}
# Maintainer: Louis Kleiver <louis.kleiver@gmail.com>
pkgname=eiota
pkgver=2.2.0
pkgrel=1
pkgdesc="A simple python script to simplify BLIH usage for Epitech students."
arch=('any')
url="https://github.com/mrCaelum/eiota"
license=('MIT')
depends=('python>=3.3.0'
	'python-requests'
	'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mrCaelum/${pkgname}/releases/latest/download/v${pkgver}.tar.gz")
sha256sums=("692b89419ccbdc2074e5007560df6156276112e50def94b075898b78aa617e18")

build() {
	mv "${pkgname}.py" "${pkgname}"
	chmod 755 "${pkgname}"
}

package() {
	mkdir -p "${pkgdir}/usr/bin"
	cp -a "${pkgname}" "${pkgdir}/usr/bin"
}

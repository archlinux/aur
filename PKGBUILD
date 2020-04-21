# Maintainer: Louis Kleiver <louis.kleiver@gmail.com>
pkgname=blihbetter
pkgver=2.4.0
pkgrel=1
pkgdesc="A simple python script to simplify BLIH usage for Epitech students."
arch=('any')
url="https://github.com/mrCaelum/blihbetter"
license=('MIT')
depends=('python>=3.3.0'
	'python-requests'
	'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mrCaelum/${pkgname}/releases/latest/download/v${pkgver}.tar.gz")
sha256sums=("a3f4ffd86cf93f062f232fdccb63e58f8983c2b701ae0098886976a4f057ceff")

build() {
	mv "${pkgname}.py" "${pkgname}"
	chmod 755 "${pkgname}"
}

package() {
	mkdir -p "${pkgdir}/usr/bin"
	cp -a "${pkgname}" "${pkgdir}/usr/bin"
}

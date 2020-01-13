# Maintainer: Louis Kleiver <louis.kleiver@gmail.com>
pkgname=eiota
pkgver=2.2.1
pkgrel=1
pkgdesc="A simple python script to simplify BLIH usage for Epitech students."
arch=('any')
url="https://github.com/mrCaelum/eiota"
license=('MIT')
depends=('python>=3.3.0'
	'python-requests'
	'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mrCaelum/${pkgname}/releases/latest/download/v${pkgver}.tar.gz")
sha256sums=("bf819215a60a6e22f0f7573a84db108fa0fc0f71979917062bbf9087a26f7bfa")

build() {
	mv "${pkgname}.py" "${pkgname}"
	chmod 755 "${pkgname}"
}

package() {
	mkdir -p "${pkgdir}/usr/bin"
	cp -a "${pkgname}" "${pkgdir}/usr/bin"
}

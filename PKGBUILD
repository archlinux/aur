# Maintainer: Jakub Pelikan jakub.pelikan@gmail.com
pkgname=create_ap-gui
pkgver=1.2.2
pkgrel=1
pkgdesc="Gui application for easy creating access points. Application allows save configuration for quickly create AP."
arch=('any')
url="https://github.com/p-eli/create_ap-gui"
license=('GPL')
depends=(
	'python-pip'
	'create_ap'
    'python>=3'
    'net-tools'
	)
source=("git+https://github.com/p-eli/create_ap-gui")
sha256sums=('SKIP')

package() {
	cd "$pkgname"
	python3 setup.py install --root="${pkgdir}" --optimize=1
}


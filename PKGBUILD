# Maintainer: Alexandru Cheltutior <acrandom@pm.me>

pkgname=protonvpn-linux-gui
pkgver=2.0.4
pkgrel=1
pkgdesc="Unofficial GUI client for ProtonVPN"
arch=("x86_64")
url="https://github.com/calexandru2018/protonvpn-linux-gui"
license=("GPL3")
depends=("python>=3.5" "python-requests==2.23.0" "python-configparser==4.0.2" "openvpn" "python-gobject" "gtk3" "libappindicator-gtk3")
makedepends=("python-setuptools")
source=("https://github.com/calexandru2018/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('7b83e32b44bff18e5ccd7c82f4c912d6')

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --optimize=1 --root="$pkgdir"
}


# Maintainer: Alexandru Cheltutior <acrandom@pm.me>

pkgname=protonvpn-linux-gui
pkgver=2.0.5
pkgrel=1
pkgdesc="Unofficial GUI client for ProtonVPN"
arch=("x86_64")
url="https://github.com/calexandru2018/protonvpn-linux-gui"
license=("GPL3")
depends=("python>=3.5" "python-requests>=2.23.0" "python-configparser>=4.0.2" "openvpn" "python-gobject" "gtk3" "libappindicator-gtk3")
makedepends=("python-setuptools")
source=("https://github.com/calexandru2018/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('fd429fe884dd37b4b9334777d6de19f8')

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --optimize=1 --root="$pkgdir"
}


# Maintainer: Alexandru Cheltutior <acrandom@pm.me>

pkgname=protonvpn-linux-gui
pkgver=1.8.3
pkgrel=3
pkgdesc="Unofficial GUI client for ProtonVPN"
arch=("x86_64")
url="https://github.com/calexandru2018/protonvpn-linux-gui"
license=("GPL3")
depends=("python>=3.5" "python-requests"  "openvpn" "python-gobject" "gtk3" "libappindicator-gtk3")
makedepends=("python-setuptools")
source=("https://github.com/calexandru2018/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('60adae5cf3413cb86454ca198cd3ca2d')

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --optimize=1 --root="$pkgdir"
}


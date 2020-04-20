# Maintainer: Alexandru Cheltutior <acrandom@pm.me>

pkgname=protonvpn-linux-gui
pkgver=2.0.6
pkgrel=1
pkgdesc="Unofficial GUI client for ProtonVPN"
arch=("x86_64")
url="https://github.com/calexandru2018/protonvpn-linux-gui"
license=("GPL3")
conflicts=("protonvpn-cli-ng" "protonvpn-cli-ng-git")
depends=("python>=3.5" "python-requests>=2.23.0" "python-configparser>=4.0.2" "openvpn" "python-gobject" "gtk3" "libappindicator-gtk3" "protonvpn-cli-ng")
makedepends=("python-setuptools")
source=("https://github.com/calexandru2018/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('88022b19711009383f45efc1e0934abf')

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --optimize=1 --root="$pkgdir"
}


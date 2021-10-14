# Maintainer: morpheusthewhite <zffromGerace@hotmail.it>

pkgname=nordpy
pkgver=1.3.5
pkgrel=1
pkgdesc="An application with gui to connect automatically to the recommended NordVPN server"
arch=('any')
url="https://github.com/morpheusthewhite/NordPy"
license=('GPL3')
groups=()
depends=('python3' 'openvpn' 'tk' 'python-requests' 'wget' 'unzip' 'net-tools')
optdepends=('networkmanager-openvpn' 'strongswan')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install='nordpy.install'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/morpheusthewhite/NordPy/archive/${pkgver}.tar.gz")
noextract=()
md5sums=('SKIP')

package() {
	mkdir -p "${pkgdir}"/usr/share/
	cp -R "$srcdir/${pkgname%-git}-${pkgver}" "${pkgdir}"/usr/share/NordPy
}

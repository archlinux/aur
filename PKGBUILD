# Contributor: Guinux <nuxgui@gmail.com>
# Maintainer: Pablo Lezaeta <prflr88 (arroba) gmail (dot) com>

pkgname=faenza-green-icon-theme
pkgver=2010.11.20
pkgrel=2
pkgdesc="Green variant of Faenza Icon theme"
url="http://gnome-look.org/content/show.php/Mint-X-Faenza+Folders+%28Mint-X-F%29?content=135238"
license=("GPL3")
arch=("any")
makedepends=()
depends=("faenza-icon-theme")
options=(!strip)
install="${pkgname}.install"
source=("http://gnome-look.org/CONTENT/content-files/135238-Mint-X-F.tar.gz"
	"inherits.patch")
sha256sums=('7713bcea0bd9d105ae2f23f3b3c8949d8c262316a8991fa7da077ac9958b4991'
            '6d77704a37ca1e22d24fc68b075843f716cb68f399ded5fb3417101f78a31af9')

prepare() {
	patch -Np1 -i ${srcdir}/inherits.patch
}

package(){
	mkdir -p "${pkgdir}"/usr/share/icons
	cp -rf Mint-X-F "${pkgdir}"/usr/share/icons/Faenza-Green
}

# Contributor: Guinux <nuxgui@gmail.com>
# Maintainer: Pablo Lezaeta <prflr88 (arroba) gmail (dot) com>

pkgname=faenza-green-icon-theme
pkgver=2010.11.20
pkgrel=3
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

prepare() {
	patch -Np1 -i ${srcdir}/inherits.patch
}

package(){
	mkdir -p "${pkgdir}"/usr/share/icons
	cp -rf Mint-X-F "${pkgdir}"/usr/share/icons/Faenza-Green
}
md5sums=('09205a1d108d586957ab26d346291be9'
         'a5e82732f9f2bbc748ff3119e9b77275')

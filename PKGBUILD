# Maintainer: Aakash Hemadri <aakashhemadri123@gmail.com>
pkgname=gk6x-bin
pkgver=1.21
_pkgname=gk6x
pkgrel=1
epoch=
pkgdesc="Configure keys, macros, and lighting on GK6X keyboards (GK64, GK84, GK61, etc)"
arch=('x86_64')
url="https://github.com/pixeltris/GK6X"
license=('MIT' 'unkown')
groups=()
depends=('mono')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/releases/download/${_pkgname^^}-v${pkgver}/${_pkgname^^}-v${pkgver}-GUI.zip" "gk6x")
noextract=()
md5sums=('3e2e94441d056f01db539b5abe295f6e'
         'f0611a521786c9ca1fc5c075d7bd8aeb')
validpgpkeys=()

package() {
	mkdir -p "$pkgdir"/opt/$_pkgname "$pkgdir"/usr/bin/
	cp gk6x "$pkgdir"/opt/$_pkgname
	cp -rf "${_pkgname^^}-v${pkgver}-GUI"/* "$pkgdir"/opt/$_pkgname
	chmod 0755 "$pkgdir"/opt/$_pkgname/gk6x
	ln -sf /opt/$_pkgname/$_pkgname "$pkgdir"/usr/bin/$_pkgname
}

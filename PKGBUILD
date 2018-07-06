# Maintainer: Opty <opty@hotmail.fr>

_gitname=JRomManager
pkgbase=jrommanager
pkgname=jrommanager
pkgver=1.5b18
pkgrel=1
pkgdesc='Java Rom Manager'
arch=('any')
license=('GPL3')
depends=('java-runtime>=8')
source=("https://github.com/optyfr/${_gitname}/releases/download/${pkgver}/${_gitname}-${pkgver}.zip")

package() {
	install -d "${pkgdir}/usr/share/java/${pkgname}/"
	cp -r lib "${pkgdir}/usr/share/java/${pkgname}/"
	install -m644 *.jar "${pkgdir}/usr/share/java/${pkgname}/"
	install -Dm755 *.sh "${pkgdir}/usr/share/java/${pkgname}/"
}

# makepkg -g >> PKGBUILD

md5sums=('df8ef44e5edd830371b15b9dcea87987')

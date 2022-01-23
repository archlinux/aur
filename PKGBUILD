# Maintainer: Lukas1818  aur at lukas1818 dot de

pkgname=grub2-theme-ettery
pkgver=1.1r18.d9e78a3
pkgrel=1
pkgdesc="Grub2 gfxmenu theme with Kirino Kosaka (Oreimo)"
url="https://github.com/Dacha204/grub2-themes-Ettery"
arch=('any')
license=('GPL2')
depends=('grub')
install="grub2-theme-ettery.install"
source=("https://github.com/Dacha204/grub2-themes-Ettery/archive/${pkgver##*r*.}.tar.gz")
sha512sums=('354b5b23879c5f1783f3c7b2fe149b7b44f44641445cf185a1ad04b8e6075e2aaa5657906bbcacf32f4047a7ecfc0b72674f1ca1427deb7305826e97805c912b')

package() {
	cd "${srcdir}/grub2-themes-Ettery-${pkgver##*r*.}"*
	mkdir -p ${pkgdir}/boot/grub/themes/
	cp -r Ettery ${pkgdir}/boot/grub/themes/
}

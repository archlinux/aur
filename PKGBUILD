#Maintainer: Jeremy Marlow <i3_arch[at]archlinux.info>
#Contributor: JJ.Ying <yingjunjiu@yahoo.com.cn>

pkgname=xcursor-azenis-blue
pkgver=2016.11.10
pkgrel=1
pkgdesc="Azenis Blue cursor theme"
arch=('any')
license=('LGPL')
source=("https://raw.githubusercontent.com/i3-Arch/PKGBUILD/master/xcursor-azenis-blue/azenis-blue.tar.gz")
md5sums=('6b88548a5e10128d21add836e8d573c3')
url="https://store.kde.org/p/999759/"

package() {
	install -dm755 "$pkgdir"/usr/share/icons/
	cp -dR --no-preserve=ownership Azenis "$pkgdir"/usr/share/icons/Azenis
	find "$pkgdir" -type f -exec chmod 644 {} +
	find "$pkgdir" -type d -exec chmod 755 {} +
}


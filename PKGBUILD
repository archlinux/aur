#Maintainer: Jeremy Marlow <i3_arch[at]archlinux.info>
#Contributor: Mickey Mouse

pkgname=xcursor-tracer
pkgver=2016.11.12
pkgrel=1
pkgdesc="Tracer cursor theme"
arch=('any')
license=('LGPL')
source=("https://raw.githubusercontent.com/i3-Arch/PKGBUILD/master/xcursor-tracer/tracer.tar.gz")
md5sums=('4dea96b3f36df38f66f3463c1f32e374')
url="https://store.kde.org/p/999815/"

package() {
	install -dm755 "$pkgdir"/usr/share/icons/
	cp -dR --no-preserve=ownership Tracer "$pkgdir"/usr/share/icons/Tracer
	find "$pkgdir" -type f -exec chmod 644 {} +
	find "$pkgdir" -type d -exec chmod 755 {} +
}


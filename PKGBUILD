# Maintainer: zekeer <isoniasid@gmail.com> 

pkgname=plank-theme-arc
pkgver=0.1
pkgrel=2
pkgdesc='Arc theme for Plank'
arch=('any')
url='https://github.com/horst3180/arc-theme'
license=('GPL3')
depends=('plank')
source=("https://manjaro.ru/aur/plank-theme/$pkgname.tar.gz")
md5sums=('60b567398e7e5afecba5ec6e2480994a')

build() {
	true
}

package() {
	cd $srcdir/$pkgname
	mkdir -p $pkgdir/usr/share/plank/themes/Arc
	install -m 755 Arc/dock.theme "${pkgdir}"/usr/share/plank/themes/Arc/
}

  
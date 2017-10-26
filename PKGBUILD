# Maintainer: Jason Gonzalez <jason at jasong-designs dot com>

pkgname=jgd-springawakening
pkgver=10_23_17
pkgrel=1
pkgdesc="Pastel yellow and green theme for GTK2 and GTK3 (3.10 and 3.20+)"
arch=('any')
url="http://www.jasong-designs.com/2016/08/12/jgd-spring-awakening-gtk/"
license=('GPL3')
depends=('gtk3' 'gtk2' 'gtk-engine-murrine')
optdepends=('openbox: optional window manager theme' 'ttf-dejavu: font support')
changelog=
source=("https://github.com/jgpws/jgd-spring-awakening/raw/master/downloads/$pkgname-${pkgver//_/-}.tar.gz")

package() {
	cd "${srcdir}"
	tar -xzvf $pkgname-${pkgver//_/-}.tar.gz
	sudo cp -R JGD-SpringAwakening /usr/share/themes
}

md5sums=('e874327a8894f55da8013dffc412e609')

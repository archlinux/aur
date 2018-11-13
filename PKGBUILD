# Maintainer: Jason Gonzalez <jason at jasong-designs dot com>

pkgname=jgd-fall-sunset
pkgver=11_10_18
pkgrel=1
pkgdesc="A dark GTK theme collection with an orange, brown and blue color scheme"
arch=('any')
url="https://www.jasong-designs.com/2018/11/11/jgd-fallsunset/"
license=('GPL3')
depends=('gtk3' 'gtk2' 'gtk-engine-murrine' )
optdepends=('openbox: optional window manager theme' 'metacity: optional window manager theme' 'ttf-dejavu: font support')
changelog=
source=("https://github.com/jgpws/jgd-fall-sunset/raw/master/downloads/$pkgname-${pkgver//_/-}.tar.gz")

package() {
	cd "${srcdir}"
	install -dm755 "$pkgdir/usr/share/themes"
	cp -R JGD-FallSunset "$pkgdir/usr/share/themes"
}


md5sums=('5ffee5ba96760ca508e525683b318c6d')

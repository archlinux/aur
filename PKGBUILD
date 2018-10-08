# Maintainer: Jason Gonzalez <jason at jasong-designs dot com>

pkgname=goldbars
pkgver=10_08_18
pkgrel=1
pkgdesc="Gold 3-D theme collection for GTK"
arch=('any')
url="https://www.jasong-designs.com/2018/10/05/goldbars/"
license=('GPL3')
depends=('gtk3' 'gtk2' 'gtk-engine-murrine' )
optdepends=('openbox: optional window manager theme' 'metacity: optional window manager theme' 'ttf-dejavu: font support')
changelog=
source=("https://github.com/jgpws/gold-bars/raw/master/downloads/$pkgname-${pkgver//_/-}.tar.gz")

package() {
	cd "${srcdir}"
	tar -xzvf gold-bars-10-08-18.tar.gz
	sudo cp -R GoldBars /usr/share/themes
}


md5sums=('0c11bb64719be2203e955db18a76a167')

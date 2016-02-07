# Maintainer: <nontlikeuname at tuta dot io>

pkgname=flattastic-theme
pkgver=20140311
pkgrel=1
pkgdesc="A flat Gtk3, Gtk2, Metacity, Unity, Xfwm4 and Openbox theme"
arch=('any')
url="http://nale12.deviantart.com/art/Flattastic-11-03-2014-424913255"
license=('GPL')
optdepends=('gnome-themes-standard: gtk3 support'
			'gtk-engine-murrine: gtk2 support'
			'gdk-pixbuf2: gtk2 support')
install=flattastic-theme.install
source=('https://github.com/Spagy/Flattastic/archive/master.zip')
md5sums=('d6de6e38b553b5e74e41c50a43589b81')

package() {
	install -d -m755 "$pkgdir/usr/share/themes/"
	cp -r Flattastic-* "$pkgdir/usr/share/themes/"
}

# Maintainer: antsa <asss1924@gmail.com>
pkgname=neap
pkgver=0.7.2
pkgrel=1
pkgdesc="A X11 workspace pager that runs in the notification area of your panel"
arch=('any')
url="https://github.com/vzxwco/neap"
license=('custom:new-BSD')
depends=('pygtk' 'python2-xlib')
provides=('neap')
conflicts=('neap-hotkey')
source=("https://github.com/vzxwco/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('b841bc3d454b00cb89d3183516f517ba')
package() {
	cd "$pkgname-$pkgver"
	install -D -m644 neap.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
	install -D -m644 License.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	install -D -m644 neap.1 ${pkgdir}/usr/share/man/man1/${pkgname}.1
	install -D -m755 neap ${pkgdir}/usr/bin/${pkgname}
}

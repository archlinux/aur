# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=tc-viewer
pkgver=1.5
pkgrel=4
pkgdesc="Watch transfers in HTB and HFSC traffic shaping classes on specified interface."
arch=('any')
url="https://web.archive.org/web/20100604054114/http://pawilcz.eu/tc-viewer/tc-viewer.html"
license=('GPL')
depends=('iproute2' 'perl')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/pf-graveyard/$pkgname/archive/v$pkgver.tar.gz")
backup=("etc/$pkgname.conf")
sha256sums=('06b77e11a63e76aaaecd1e2b78932709cfc25b6023f01563ff6477daccf99a2a')

package() {
	cd "$pkgname"
	install -D "$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 "$pkgname.conf" -t "$pkgdir/etc/"
}

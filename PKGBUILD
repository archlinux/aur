pkgname=mandb-instant-update
pkgver=1.0
pkgrel=0
pkgdesc="Updates mandb index database during package updates/installs"
arch=('any')
url=
license=('MIT')
depends=('man-db')
conflicts=()
replaces=()
source=(mandb-instant-update.hook)
sha256sums=('ff8de48dfff94cc227ec9b970b2a568314e1d374e359f728d9af0fd63ffaa4a2')

package() {
	install -Dm644 mandb-instant-update.hook "$pkgdir/usr/share/libalpm/hooks/mandb-instant-update.hook"
}

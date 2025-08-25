# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Bart Louwers <sleeping@emeel.net>
pkgname=multi-git-status
pkgver=2.3
pkgrel=1
pkgdesc='Show uncommited, untracked and unpushed changes in multiple Git repositories.'
arch=('any')
url='https://github.com/fboender/multi-git-status'
license=('MIT')
source=("${pkgname}-${pkgver}-${pkgrel}::${url}/archive/${pkgver}.tar.gz")
sha256sums=('2634b4b8b3d69a397f5462ec1d72a77d5b395f363ed8e1aabfbf7e5e4172f93f')

package() {
	cd "$pkgname-$pkgver"
	install -d "$pkgdir"/usr/bin/
	install -d "$pkgdir"/usr/share/man/man1/
	install mgitstatus "$pkgdir"/usr/bin/
	install mgitstatus.1 "$pkgdir"/usr/share/man/man1/
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

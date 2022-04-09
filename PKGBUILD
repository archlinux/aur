# Maintainer: Bart Louwers <sleeping@emeel.net>
pkgname=multi-git-status
pkgver=2.1
pkgrel=1
pkgdesc='Show uncommited, untracked and unpushed changes in multiple Git repositories.'
arch=('any')
url='https://github.com/fboender/multi-git-status'
license=('MIT')
source=("https://github.com/fboender/$pkgname/archive/$pkgver.tar.gz")
md5sums=('730fa9763eb3d4eeccb6b19fdd59ef68')

package() {
	cd "$pkgname-$pkgver"
	install -d "$pkgdir"/usr/bin/
	install -d "$pkgdir"/usr/share/man/man1/
	install mgitstatus "$pkgdir"/usr/bin/
	install mgitstatus.1 "$pkgdir"/usr/share/man/man1/
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=tmpmail
pkgver=1.1.9
_commit=0fdfe4955cfd0fff44a6c9073a4c30816e1cd615
pkgrel=2
pkgdesc='A temporary email right from your terminal written in POSIX sh'
arch=(any)
url=https://github.com/sdushantha/tmpmail
license=(MIT)
depends=(w3m curl jq)
makedepends=(git)
source=("git+$url.git#commit=$_commit")
md5sums=(SKIP)

package() {
	cd "$pkgname"
	install -Dm755 tmpmail -t "$pkgdir/usr/bin"
	install -Dm644 tmpmail.1 -t "$pkgdir/usr/share/man/man1"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

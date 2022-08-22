# Maintainer: yuioto <yuiotochan@outlook.com>

pkgname='erg-bin'
_pkgname="erg"
pkgver=0.2.7
pkgrel=1
pkgdesc="A statically typed language that can deeply improve the Python ecosystem"
url="https://github.com/erg-lang/erg"
license=('MIT' 'Apache')
arch=('x86_64')
conflicts=('erg-git' 'erg')
depends=('python')
makedepends=('cargo' 'git')

source=("$_pkgname::https://yuioto-onedrive.vercel.app/api/raw/?path=/tmp/erg/bin/erg-v$pkgver-$arch")
sha256sums=('eb23521fe0ed17debf65b7f4660a92cd402a215c0b60c4475812b24602034eaf')

package() {
	install -Dm755 erg -t "$pkgdir/usr/bin"
	install -Dm644 $startdir/LICENSE-{MIT,APACHE} -t "$pkgdir/usr/share/licenses/$pkgname"
}
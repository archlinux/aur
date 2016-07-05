# Contributor: graysky <graysky AT archlinux dot us>

pkgname=lostfiles
pkgver=3.22
pkgrel=1
pkgdesc='Find orphaned files not owned by any Arch packages'
arch=('any')
license=('GPL2')
url="https://github.com/graysky2/lostfiles"
source=("https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('c6d9ee0b3e57387faa72fb82164fc3db5241ee4501b538b7180363d5e70e4dd4')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}

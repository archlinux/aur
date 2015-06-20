# Maintainer: Florian Léger <florian6 dot leger at laposte dot net>
# Contributor: itsme <itsme@ishere.ru>

pkgname='hda-verb'
pkgver=0.4
pkgrel=1
pkgdesc="Tool to send commands (verbs) to HD-Audio codecs"
arch=('i686' 'x86_64')
depends=('glibc')
url="ftp://ftp.suse.com/pub/people/tiwai/misc"
license=('GPL')
source=("$url/$pkgname-$pkgver.tar.gz")
md5sums=('60be775c58feb2f8b9644dfeca0ad0d8')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

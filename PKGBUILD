# Maintainer: channel-42 <info@devls.de>
# Maintainer: corusm <dev@corusm.de>
pkgname=wppfzf
pkgver=0.1.0
pkgrel=2
pkgdesc="Browse and download images from reddit with fzf"
arch=('any')
url="https://github.com/channel-42/wppfzf"
license=('GPL3')
groups=('misc')
depends=('python' 'wget' 'fzf' 'bash' 'ueberzug')
source=("https://github.com/channel-42/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('ef6561e2c7ec658108ccbf6f406ae96a')

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: ts=2 sw=2 et ft=PKGBUILD:

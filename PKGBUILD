# Maintainer: dpi0 <dpi0.dev@proton.me>

pkgname=trashy-bin
pkgver=2.0.0
pkgrel=1
pkgdesc='a cli system trash manager, alternative to rm and trash-cli'
arch=('x86_64')
url="https://github.com/oberblastmeister/trashy"
license=('MIT' 'Apache-2.0')
depends_x86_64=('gcc-libs')
provides=('trashy')
conflicts=('trashy' 'trash-cli')
source=("$pkgname-$pkgver.tar.gz::https://github.com/oberblastmeister/trashy/releases/download/v$pkgver/trash-$CARCH-unknown-linux-gnu.tar.gz"
	"LICENSE-MIT::https://raw.githubusercontent.com/oberblastmeister/trashy/v$pkgver/LICENSE-MIT"
	"LICENSE-APACHE::https://raw.githubusercontent.com/oberblastmeister/trashy/v$pkgver/LICENSE-APACHE")
sha256sums=('a122c8994c6884629c0157fe9d375c9a156a14b236ccbb1aee28b08c3fa59a13'
	'aec51b90033e3af830ba9fee7f5644c2b58bede1331dd7051867856724982f75'
	'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')

package() {
	install -Dm0755 trash "$pkgdir/usr/bin/trash"
	install -Dm0644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
	install -Dm0644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}

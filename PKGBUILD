# Maintainer: Jonian Guveli <jonian@hardpixel.eu>
# Contributor: pancho horrillo <pancho at pancho dot name>

pkgname=the_platinum_searcher-bin
pkgdesc="A code search tool similar to ack, the_silver_searcher (ag) and ripgrep (rg)."
pkgver=2.2.0
pkgrel=2
arch=("x86_64")
url="https://github.com/monochromegane/the_platinum_searcher"
license=("MIT")
provides=("the_platinum_searcher")
conflicts=("the_platinum_searcher")
source=("${pkgname/-bin}-${pkgver}::$url/releases/download/v$pkgver/pt_linux_amd64.tar.gz")
sha256sums=('2929afa95ea4efddd8d581343adca24690cd84616800becd090f06ccd3795ed8')

package() {
  install -Dm755 "$srcdir/pt_linux_amd64/pt" "$pkgdir/usr/bin/pt"
  install -Dm644 "$srcdir/pt_linux_amd64/README.md" "$pkgdir/usr/share/doc/${pkgname/-bin}/README.md"
}

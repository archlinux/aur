# Maintainer: Dane Hobrecht <76x5l22l@anonaddy.me>

pkgname=fzd-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Fuzzy-found file or URL opener in the user's default application."
arch=('any')
url="https://github.com/danehobrecht/fzd"
license=('GPL')
depends=("fzf" "xdg-utils")
source=("https://github.com/danehobrecht/fzd/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('bf9fb4880b515c8aa2748f16a2035d3c531daae4c6f132364b27056f52fc3cd9')

package() {
	install -Dm755 fzd "$pkgdir/usr/bin/fzd"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
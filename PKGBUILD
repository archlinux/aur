# If you have a problem/question or want to improve this PKGBUILD,
# you can create an issue/pull request on this Github repository:
#
# https://github.com/siaeyy/PKGBUILDs
#
# You can still use the Arch website as well.
#

_pkgname=purl
pkgname="$_pkgname"-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A curl-esque CLI for making HTTP requests that require payment. Designed for humans and agents alike."
arch=('x86_64')
url="https://github.com/stripe/purl"
license=('MIT')
options=(!lto)
makedepends=('rust')
checkdepends=('rust')
source_x86_64=("$_pkgname::$url/releases/download/v$pkgver/$_pkgname-linux-amd64")
sha256sums_x86_64=('21476a9bd0d455b86b75cd5292e6f28bf91694d94832c7b5059ea3f55881eea4')

package() {
	cd "$srcdir"
	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
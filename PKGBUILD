# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>
# Contributor: Wilson E. Alvarez <wilson.e.alvarez@rubonnek.com>
_pkgname="forgejo-runner"
pkgname="$_pkgname-bin"
pkgver=6.4.0
pkgrel=1
pkgdesc="Continuous integration for Forgejo"
arch=('x86_64' 'aarch64')
url="https://code.forgejo.org/forgejo/runner"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver-LICENSE::https://code.forgejo.org/forgejo/runner/raw/tag/v$pkgver/LICENSE")
source_x86_64=("$_pkgname-$pkgver::https://code.forgejo.org/forgejo/runner/releases/download/v$pkgver/$_pkgname-$pkgver-linux-amd64")
source_aarch64=("$_pkgname-$pkgver::https://code.forgejo.org/forgejo/runner/releases/download/v$pkgver/$_pkgname-$pkgver-linux-arm64")
sha256sums=('c3150f60d815062cff3cfa4b5dbc6efd0c217f2eab30a30b3a4988548214bdba')
sha256sums_x86_64=('471f460a7b89a5e6716e96efd3cc014017a26f6d7b531118577410474111f697')
sha256sums_aarch64=('471f460a7b89a5e6716e96efd3cc014017a26f6d7b531118577410474111f697')

package() {
    install -Dm644 "$_pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}

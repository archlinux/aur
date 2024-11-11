# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>
# Contributor: Wilson E. Alvarez <wilson.e.alvarez@rubonnek.com>
_pkgname="forgejo-runner"
pkgname="$_pkgname-bin"
pkgver=4.0.1
pkgrel=2
pkgdesc="Continuous integration for Forgejo"
arch=('x86_64' 'aarch64')
url="https://code.forgejo.org/forgejo/runner"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver-LICENSE::https://code.forgejo.org/forgejo/runner/src/tag/v$pkgver/LICENSE")
source_x86_64=("$_pkgname-$pkgver::https://code.forgejo.org/forgejo/runner/releases/download/v$pkgver/$_pkgname-$pkgver-linux-amd64")
source_aarch64=("$_pkgname-$pkgver::https://code.forgejo.org/forgejo/runner/releases/download/v$pkgver/$_pkgname-$pkgver-linux-arm64")
sha256sums=('dbde5f109f46cfbef2bf33d1a66a788d94adf72dd23ca8fb8b894856d9af1125')
sha256sums_x86_64=('45f513988b7136c1dc62316d9d635f0791fa0c5be7f6735560980988cf0c5c8a')
sha256sums_aarch64=('45f513988b7136c1dc62316d9d635f0791fa0c5be7f6735560980988cf0c5c8a')

package() {
    install -Dm644 "$_pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}

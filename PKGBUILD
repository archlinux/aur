# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>
# Contributor: Wilson E. Alvarez <wilson.e.alvarez@rubonnek.com>
_pkgname="forgejo-runner"
pkgname="$_pkgname-bin"
pkgver=9.1.1
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
sha256sums=('76b00148813a25e79dd9a4dd555eb1b4d25a99eab51fcbd8e5660ee69918a18c')
sha256sums_x86_64=('6f2a34b040a1bc7094e81209cb871c9739205973264480839fc3b7030ce66bac')
sha256sums_aarch64=('6f2a34b040a1bc7094e81209cb871c9739205973264480839fc3b7030ce66bac')

package() {
    install -Dm644 "$_pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}

# Maintainer: Wayne Martin <ghwinslow1700@hotmail.com>
pkgname=repocheck
pkgver=0.1.0
pkgrel=1
pkgdesc="Fast CLI tool to scan git repos for health problems — missing files, hardcoded secrets, stale branches, and more"
arch=('x86_64')
url="https://github.com/Wtmartin8089/repocheck"
license=('MIT')
depends=('git')
provides=('repocheck')
conflicts=('repocheck-git')
source=(
    "$pkgname-$pkgver::$url/releases/download/v$pkgver/$pkgname"
    "LICENSE::$url/raw/master/LICENSE"
)
sha256sums=(
    'fc550af08450e438c09cacbca3dd2aa1b9b614f1e0df8777b00402528fda1bc3'
    'SKIP'
)

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

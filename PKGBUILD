# Maintainer: Jörn Hofmann <joernhofmann@web.de>
# Contributor: Radoslaw Mejer <radmen@radmen.info>

pkgname="git-toolbelt"
pkgver=1.9.3
pkgrel=1
pkgdesc="A suite of useful Git commands that aid with scripting or every day command line usage"
arch=(any)
license=('BSD')
url="https://github.com/nvie/git-toolbelt"
depends=('coreutils>=2.9' 'git')
source=(
    "git-toolbelt-$pkgver.zip::https://github.com/nvie/git-toolbelt/archive/v$pkgver.tar.gz"
)
sha256sums=(
    "d39e45a9d2a2501bc6f06fc0c5eb8f1fb7a3b372c0ee4d6def4c77541d102c44"
)

package() {
    install -d "$pkgdir/usr/bin"
    install -Dm755 "$srcdir"/git-toolbelt-$pkgver/git-* "$pkgdir/usr/bin/"
    install -Dm644 "$srcdir/git-toolbelt-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

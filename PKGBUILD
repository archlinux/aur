# Maintainer: Jörn Hofmann <joernhofmann@web.de>
# Contributor: Radoslaw Mejer <radmen@radmen.info>

pkgname="git-toolbelt"
pkgver=1.8.0
pkgrel=1
pkgdesc="A suite of useful Git commands that aid with scripting or every day command line usage"
arch=(any)
license=('BSD')
url="https://github.com/nvie/git-toolbelt"
source=(
    "git-toolbelt-$pkgver.zip::https://github.com/nvie/git-toolbelt/archive/v$pkgver.tar.gz"
)
sha256sums=(
    "8c504a66715efe2fa544b54b464881b5575201d94a3ff31c21934b23c16bda31"
)

package() {
    install -d "$pkgdir/usr/bin"
    install -Dm755 "$srcdir"/git-toolbelt-$pkgver/git-* "$pkgdir/usr/bin/"
    install -Dm644 "$srcdir/git-toolbelt-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

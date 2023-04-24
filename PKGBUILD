# Maintainer: Jörn Hofmann <joernhofmann@web.de>
# Contributor: Radoslaw Mejer <radmen@radmen.info>

pkgname="git-toolbelt"
pkgver=1.8.4
pkgrel=1
pkgdesc="A suite of useful Git commands that aid with scripting or every day command line usage"
arch=(any)
license=('BSD')
url="https://github.com/nvie/git-toolbelt"
depends=('cureutils>=9.2' 'git')
source=(
    "git-toolbelt-$pkgver.zip::https://github.com/nvie/git-toolbelt/archive/v$pkgver.tar.gz"
)
sha256sums=(
    "a703d964775b978564735471c6d004611915c5cf5bdbd4f49e546aff7fb0c418"
)

package() {
    install -d "$pkgdir/usr/bin"
    install -Dm755 "$srcdir"/git-toolbelt-$pkgver/git-* "$pkgdir/usr/bin/"
    install -Dm644 "$srcdir/git-toolbelt-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

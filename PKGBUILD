# Maintainer: Jörn Hofmann <joernhofmann@web.de>
# Contributor: Radoslaw Mejer <radmen@radmen.info>

pkgname="git-toolbelt"
pkgver=1.10.0
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
    "b6b23f61604b7a89a0bf7486ef9c32a34c95cf6b57c27376ff69d70c12fbf7c1"
)

package() {
    install -d "$pkgdir/usr/bin"
    install -Dm755 "$srcdir"/git-toolbelt-$pkgver/git-* "$pkgdir/usr/bin/"
    install -Dm644 "$srcdir/git-toolbelt-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

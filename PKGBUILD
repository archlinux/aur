pkgname="git-toolbelt"
pkgver=1.4.0
pkgrel=1
pkgdesc="A suite of useful Git commands that aid with scripting or every day command line usage"
arch=(any)
url="https://github.com/nvie/git-toolbelt"
source=(
    "git-toolbelt-$pkgver.zip::https://github.com/nvie/git-toolbelt/archive/v$pkgver.tar.gz"
)
sha256sums=(
    "3c9f69cfee1ca8057069a93be4f6e10f8ce90c1f1989d969aebf6cc97e24b965"
)

package() {
    install -d "$pkgdir/usr/bin"
    install -Dm755 "$srcdir"/git-toolbelt-$pkgver/git-* "$pkgdir/usr/bin/"
}

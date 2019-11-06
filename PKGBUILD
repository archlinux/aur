pkgname="git-toolbelt"
pkgver=1.3.0
pkgrel=1
pkgdesc="A suite of useful Git commands that aid with scripting or every day command line usage"
arch=(any)
url="https://github.com/nvie/git-toolbelt"
source=(
    "git-toolbelt-$pkgver.zip::https://github.com/nvie/git-toolbelt/archive/v$pkgver.tar.gz"
)
sha256sums=(
    "ed369d58476e10a0a0c025c889dcf7a15e3abe7eb60db2e716d9a4b25db0e892"
)

package() {
    install -d "$pkgdir/usr/bin"
    install -Dm755 "$srcdir"/git-toolbelt-$pkgver/git-* "$pkgdir/usr/bin/"
}

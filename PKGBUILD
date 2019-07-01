# Maintainer: Oliver Mangold omangold at gmail dot com

pkgname=dnf-legacy-utils
pkgver=1.0.0
pkgrel=2
pkgdesc="Links to dnf builtins for yum and yum-utils"
arch=('any')
license=(BSD)
depends=(dnf)
conflicts=(yum yum-utils)
provides=(yum)
source=(
    debuginfo-install
    needs-restarting
    repo-graph
    repoclosure
    repodiff
    repomanage
    repoquery
    reposync
    yum-builddep
    yumdownloader
)
md5sums=(
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
)

package() {
    install -d "$pkgdir/usr/bin"
    ln -s dnf "$pkgdir/usr/bin/yum"
    install -m 755 "$srcdir"/* "$pkgdir/usr/bin"
}

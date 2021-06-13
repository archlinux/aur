# Maintainer: Ehsan Ghorbannezad <ehsangn@protonmail.ch>
pkgname=tmpcleaner
pkgver=r1
pkgrel=1
pkgdesc='simple script and cron.daily entry for cleaning old /tmp files.'
arch=(any)
license=(GPL)
source=($pkgname.sh $pkgname.cron)
provides=($pkgname)
conflicts=($pkgname)

sha256sums=(
    d9550450329e9173f25ca638ae75b6b920bb44b47f31bb48b95ea67e7f70dd41
    9e716da422b70bfdb212c2974442261485284d3ba609a837cad705c936e8fa37
)

package() {
    cd "$srcdir"
    install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
    install -Dm755 $pkgname.cron "$pkgdir/etc/cron.daily/$pkgname"
}

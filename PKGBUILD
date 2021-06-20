# Maintainer: Ehsan Ghorbannezad <ehsangn@protonmail.ch>
pkgname=tmpcleaner
pkgver=r2
pkgrel=1
pkgdesc='simple script and cron.daily entry for cleaning old /tmp files.'
arch=(any)
license=(GPL)
source=($pkgname.sh $pkgname.cron)
provides=($pkgname)
conflicts=($pkgname)

sha256sums=('e9bd77559ef22188564b24b8f2c6e744532c6532950183eb9aeb350294a7b917'
            '9e716da422b70bfdb212c2974442261485284d3ba609a837cad705c936e8fa37')

package() {
    cd "$srcdir"
    install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
    install -Dm755 $pkgname.cron "$pkgdir/etc/cron.daily/$pkgname"
}

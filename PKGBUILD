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

sha256sums=('862e4357074e6b9ca8ce05f714249c0f886688d8dfb11c8a8a522150fffe2377'
            '9e716da422b70bfdb212c2974442261485284d3ba609a837cad705c936e8fa37')

package() {
    cd "$srcdir"
    install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
    install -Dm755 $pkgname.cron "$pkgdir/etc/cron.daily/$pkgname"
}

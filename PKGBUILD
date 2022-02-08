# Maintainer: Ehsan Ghorbannezad <ehsan at disroot dot org>
pkgname=tmpcleaner
pkgver=r9
pkgrel=2
pkgdesc='simple script and cron.daily entry for cleaning old /tmp files.'
arch=(any)
license=(GPL)
source=($pkgname.sh $pkgname.cron)

sha256sums=('cf3147daee19e205a55255dceba3a83ed4d5cb64a35d88bf0097a45e02e9bd50'
            '18cac20919ae33e46e8d25c6e9a6305504a5cf2d41059750fe3cd0205a1d2fa1')

package() {
    cd "$srcdir"
    install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
    install -Dm755 $pkgname.cron "$pkgdir/etc/cron.daily/$pkgname"
}

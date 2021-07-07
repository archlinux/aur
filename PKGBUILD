# Maintainer: Ehsan Ghorbannezad <ehsangn@protonmail.ch>
pkgname=tmpcleaner
pkgver=r8
pkgrel=1
pkgdesc='simple script and cron.daily entry for cleaning old /tmp files.'
arch=(any)
license=(GPL)
source=($pkgname.sh $pkgname.cron)
provides=($pkgname)
conflicts=($pkgname)

sha256sums=('cf3147daee19e205a55255dceba3a83ed4d5cb64a35d88bf0097a45e02e9bd50'
            'cc1d51f6762e639d5dc2191cfd70d70e4ea77e026f523c26a53b8387ef251607')

package() {
    cd "$srcdir"
    install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
    install -Dm755 $pkgname.cron "$pkgdir/etc/cron.daily/$pkgname"
}

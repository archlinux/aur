# Maintainer: Ehsan Ghorbannezad <ehsangn@protonmail.ch>
pkgname=dictd-runit
pkgver=r1
pkgrel=1
pkgdesc='runit service scripts for dictd'
url="https://aur.archlinux.org/packages/$pkgname"
arch=(any)
license=(GPL)
depends=(runit dictd)
source=(dictd.run dictd.finish)
sha256sums=('03e14ddf8a5bbe63625d96a8942ad166b467ae7b78672035964e7dc2bdbd9965'
            '22a2152e470acbeda7059141314d270d8e727719b8cf7c43e7265480add2187d')

package() {
    cd "$srcdir"
    install -Dm755 ${source[@]} -t "$pkgdir/etc/runit/sv/dictd/run"
}

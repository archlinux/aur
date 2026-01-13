# Contributor: libele <libele@disroot.org>
# Contributor: Schroedinger <1181822466 at qq dot com>
# Contributor: dacoit <dacoit at tuta.io>
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>
# Contributor: Evan Gates <evan.gates at gmail dot com>
# Contributor: Vardyr <vardyr.al at insocada dot com>

pkgname=woof
pkgver=0.5
_commit=91079007dc2f2ec72178739685392dfe734d450d
pkgrel=1
pkgdesc='ad-hoc single file webserver; Web Offer One File'
arch=('any')
url="http://www.home.unix-ag.org/simon/$pkgname.html"
license=('GPL-2.0-or-later')
depends=('python3')
makedepends=('git')
source=(git+https://codeberg.org/nomis/woof.git#commit=${_commit})
b2sums=('ff77a9b3864bdcfb644329e9ee203e92ec32ff5e59c6bd5acafa0ba1dd3ba2169964df1b2f042989a883e0720cb8f7bfcee9d41d5be97eb3d3a00d596b475635')


package() {
    cd "$pkgname"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

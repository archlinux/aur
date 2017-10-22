# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=fbmenugen
pkgver=0.82
pkgrel=1
pkgdesc="A simple menu generator for the Fluxbox Window Manager."
arch=('any')
url="https://github.com/trizen/$pkgname"
license=('GPL3')
depends=('perl>=5.14.0' 'fluxbox' 'gtk2-perl' 'perl-data-dump' 'perl-linux-desktopfiles>=0.25')
optdepends=('perl-file-desktopentry: locale support')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('3a57cefa932bb6de646b82277b24cc748360a29bb9fb40bb9fc25e0aaef01988')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "schema.pl" "$pkgdir/etc/xdg/$pkgname/schema.pl"
    #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=obmenu-generator
pkgver=0.80
pkgrel=1

pkgdesc="A fast pipe/static menu generator for the Openbox Window Manager (with icons support)."
url="https://github.com/trizen/$pkgname"

arch=('any')
license=('GPL3')

depends=('openbox' 'perl>=5.14.0' 'gtk2-perl' 'perl-data-dump' 'perl-linux-desktopfiles>=0.09')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('7091f1cbf73495cc186af3dd92a85846c1e44c6ec97dad6ae523ce108eb29914')
install='readme.install'

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "schema.pl" "$pkgdir/etc/xdg/$pkgname/schema.pl"
    #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

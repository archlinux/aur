# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=obmenu-generator
pkgver=0.66
pkgrel=1

pkgdesc="A fast pipe/static menu generator for the Openbox Window Manager (with icons support)."
url="https://github.com/trizen/$pkgname"

arch=('any')
license=('GPLv3')

depends=('openbox' 'perl>=5.14.0' 'perl-data-dump' 'perl-linux-desktopfiles>=0.09')
source="https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz"
sha256sums=('6a2c8b2add2fd5bd31b40a67dd6e0920282019e3706f172ad67d6e466f82f769')
install='readme.install'

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "schema.pl" "$pkgdir/etc/xdg/$pkgname/schema.pl"
    #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

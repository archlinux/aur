# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=fbmenugen
pkgver=0.77
pkgrel=1
pkgdesc="A simple menu generator for the Fluxbox Window Manager."
arch=('any')
url="https://github.com/trizen/$pkgname"
license=('GPLv3')
depends=('perl>=5.14.0' 'fluxbox' 'perl-data-dump' 'perl-linux-desktopfiles>=0.08')

source=("https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('434cf9d75c48f7f6a38c3ae15e7e559ae87e4a7c2da8f98b65e7826aebc5f64a')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "schema.pl" "$pkgdir/etc/xdg/$pkgname/schema.pl"
    #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

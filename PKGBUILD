# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=menutray
pkgver=0.44
pkgrel=1

pkgdesc="A simple GTK+ application menu tray, written in Perl."
url="https://github.com/trizen/$pkgname"

arch=('any')
license=('GPLv3')

depends=('perl>=5.14.0' 'gtk2-perl' 'perl-data-dump' 'perl-linux-desktopfiles>=0.08')
optdepends=('perl-gtk3: for Gtk3 support (--gtk3)')
source="https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz"
sha256sums=('af2d13e6edd97fbe68aa2125eaee6280aa080f8dda142a8551a0bdf96591ee99')
install='readme.install'

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "schema.pl" "$pkgdir/etc/xdg/$pkgname/schema.pl"
    #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

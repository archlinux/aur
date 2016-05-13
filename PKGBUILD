# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=menutray
pkgver=0.45
pkgrel=1

pkgdesc="A simple GTK+ application menu tray, written in Perl."
url="https://github.com/trizen/$pkgname"

arch=('any')
license=('GPLv3')

depends=('perl>=5.14.0' 'gtk2-perl' 'perl-data-dump' 'perl-linux-desktopfiles>=0.08')
optdepends=('perl-gtk3: for Gtk3 support (--gtk3)')
source=("https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('91eafc1a784edac8eecde37beecc02ba0857679ea9ff42b3f3e597e3538a41cb')
install='readme.install'

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "schema.pl" "$pkgdir/etc/xdg/$pkgname/schema.pl"
    #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

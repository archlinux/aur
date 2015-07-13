pkgname="plymouth-theme-ozunity-gnomish"
pkgver=0.1
pkgrel=1
pkgdesc="Oz Unity plymouth splash with GNOME background"
arch=('any')
url="https://github.com/ryanvade/plymouth-theme-ozunity-gnomish/"
license=('GPL')
depends=('plymouth')
install='plymouth-ozunity-gnomish.install'
source=(${pkgname}::"git+https://github.com/ryanvade/plymouth-theme-ozunity-gnomish.git"
	"plymouth-ozunity-gnomish.install")

package() {
    cd $srcdir/$pkgname
    mkdir -p $pkgdir/usr/share/plymouth/themes/ozunity-gnomish/
    install -Dm644 * $pkgdir/usr/share/plymouth/themes/ozunity-gnomish
}
md5sums=('SKIP'
	 '9198d4d882bd91a48766d26783a6f9c3')


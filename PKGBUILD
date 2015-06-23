# Maintainer: Tim Rice < t [dot] rice [at] ms [dot] unimelb [dot] edu [dot] au>
pkgname=satanic-gnome-themes
pkgver=666.8
pkgrel=1
pkgdesc="Themes for Gnome/GTK from Ubuntu Satanic Edition."
url="http://www.ubuntusatanic.org"
arch=('any')
license=('GPL')
depends=('gtk-engine-aurora' 'satanic-icon-themes')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("$url/hell/pool/main/s/$pkgname/${pkgname}_${pkgver}_all.deb")

build() {
    msg "Extracting ... "
    ar xv ${pkgname}_${pkgver}_all.deb || return 1
    tar xvf data.tar.gz || return 1
    msg2 "Done extracting."
}

package() {
    msg "Moving files ... "
    mv $srcdir/usr $pkgdir || return 1
    msg2 "Done moving files."
}
md5sums=('515b495d50cf5d6e983aa9246cd2b5a1')

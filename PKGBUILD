# Maintainer: Andreas Linz <alinz@klingt.net>

pkgname=adapta-gtk-theme-deb
_gtk_version='3.21.2'
_git_version='git20160613-2-0'
pkgver="${_gtk_version}"
pkgrel=1
pkgdesc='An adaptive Gtk+ theme based on Material Design Guidelines.'
arch=(any)
url='https://github.com/tista500/Adapta'
license=('MIT')
depends=()
provides=('adapta-gtk-theme')
conflicts=('adapta-gtk-theme')
makedepends=(dpkg)
optsdepends=()
source=("https://launchpad.net/~tista/+archive/ubuntu/adapta/+files/adapta-gtk-theme_${pkgver}+${_git_version}ubuntu1~yakkety1_all.deb")
md5sums=('08b4cd6603051561a574afe634ba3a65')

package() {
    dpkg -x $srcdir/adapta-gtk-theme_${pkgver}+${_git_version}ubuntu1~yakkety1_all.deb $pkgdir
    rm -r $pkgdir/usr/share/doc
    install -m 755 -d $pkdir/usr/share /usr/share
}

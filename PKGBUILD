# Maintainer: Andreas Linz <alinz@klingt.net>

pkgname=adapta-gtk-theme-deb
_gtk_version='3.21.2'
_git_version='git20160619'
_package_version="${_gtk_version}+${_git_version}-0"
pkgver="${_gtk_version}.${_git_version}"
pkgrel=1
pkgdesc='An adaptive Gtk+ theme based on Material Design Guidelines.'
arch=(any)
url='https://github.com/tista500/Adapta'
license=('GPL' 'custom:CC-BY-SA-3.0+')
depends=()
provides=('adapta-gtk-theme')
conflicts=('adapta-gtk-theme')
makedepends=()
optdepends=()
source=("https://launchpad.net/~tista/+archive/ubuntu/adapta/+files/adapta-gtk-theme_${_package_version}ubuntu1~yakkety1_all.deb")
md5sums=('c19f596f4d499a7bdf4fbc14892f74eb')

package() {
    dpkg -x $srcdir/adapta-gtk-theme_${_package_version}ubuntu1~yakkety1_all.deb $pkgdir
    rm -r $pkgdir/usr/share/doc
    install -m 755 -d $pkdir/usr/share /usr/share
}

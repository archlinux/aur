# Contributor: ShadowKyogre <shadowkyogre@aim.com>

pkgname=compiz-pipeitems
pkgver=1.0.1
pkgrel=1
pkgdesc="Compiz boxmenu pipeitems, most converted from some openbox pipemenus"
arch=('any')
url="http://sourceforge.net/projects/compizboxmenupi"
license=('GPL')
depends=('python2' 'bash')
install=$pkgname.install
_filename=compiz-boxmenu-pipeitems
source=(http://master.dl.sourceforge.net/project/compizboxmenupi/tarballs/${_filename}_-_${pkgver}.tar.gz)
md5sums=('096152235a1fa18567649a56120f2fbe')

build() {
 mkdir -p $pkgdir/usr{/bin,/share/doc/compiz-pipes}
 msg "Putting pipeitems in correct location"
 cp -v $srcdir/compiz_pipes/cpz{audacious,bookmarks{,_icons},trash{,_icons},calendar{,_icons}.sh,places{,_icons}.sh,browse,filebrowser,weather.py} $pkgdir/usr/bin
 cp -v $srcdir/compiz_pipes/manage_menus.sh $pkgdir/usr/bin
 msg "Putting README in the correct location"
 cp -v $srcdir/compiz_pipes/README $pkgdir/usr/share/doc/compiz-pipes
}

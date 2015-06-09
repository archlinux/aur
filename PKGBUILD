# Maintainer: Andy Crowd  
### Maintainer: jw <jase.wobble@gmail.com>
pkgname=sakis3g
pkgver=0.2.0e
pkgrel=3
pkgdesc="An all-in-one script for connecting with 3G"
arch=(any)
#arch=(i686 x86_64)
url="http://sourceforge.net/projects/vim-n4n0/?source=navbar"
license="GPL2"
depends=('ppp' 'net-tools')
optdepends=('usb_modeswitch: for switching USB modems' 
'kdialog: Graphical UI'
'zenity: Graphical UI'
'Xdialog: Graphical UI'
'whiptail: Text UI'
'dialog: Text UI'
'konsole: Terminal emulator'
'xterm: Terminal emulator'
'9menu: Simple and easily configurable X-menu / program launcher')

#source=("http://optimate.dl.sourceforge.net/project/vim-n4n0/sakis3g.tar.gz")
source=("http://garr.dl.sourceforge.net/project/vim-n4n0/sakis3g.tar.gz")
md5sums=('2a040d7901b629d42718502eae6048e6')
##
#"sakis3g-rc" )
##

package() {
#  mkdir -p $pkgdir/usr/bin
#  cp $srcdir/sakis3g $pkgdir/usr/bin
#  chmod +x $pkgdir/usr/bin/sakis3g
#  mkdir -p $pkgdir/etc/rc.d
#  cp $srcdir/sakis3g-rc $pkgdir/etc/rc.d/sakis3g
  install -d "$pkgdir/usr/bin"
  install -m755 "sakis3g" "$pkgdir/usr/bin"
}

post_install(){
echo "If no GUI is shown then try 
export QT_X11_NO_MITSHM=1
before starting Xserver.

For using with sudo uncomment related to X11 settings
in the /etc/sudoers
"
}

#md5sums=('f60763ca65a0a9fdb2608e1734171740' 
#'8a9c2b686bab1a1eae24f29955dee7ab')
#

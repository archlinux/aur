
# Maintainer: liberodark

pkgname=ftop
pkgver=1.0
pkgrel=1
pkgdesc="Utility that shows shows progress of open files and file systems"
arch=('x86_64')
url="https://linux.die.net/man/1/ftop"
license=('GPL 3')
depends=('ncurses5-compat-libs' 'glib2')
source_x86_64=("http://ftp.tu-chemnitz.de/pub/linux/dag/redhat/el7/en/x86_64/rpmforge/RPMS/ftop-${pkgver}-${pkgrel}.el7.rf.x86_64.rpm")
sha512sums_x86_64=('a0848de5491385240701adeb1078821c10ea0fdcfb8683b9879fcbe2bf15c0bcc20566f89ad170adc5d239b2af470e9e946dc11ce849c01f2a572142b77a7d52')
        
package() {
  cd $srcdir
  cp -r usr $pkgdir
}

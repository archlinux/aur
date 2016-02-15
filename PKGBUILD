# Maintainer:	Silvio Knizek <killermoehre@gmx.net>
# Contributor:	René Herman <rene dot herman at gmail dot com>

pkgname=lightdm-flexiserver
pkgver=1.0.0
pkgrel=1
pkgdesc="Shell script to relay gdmflexiserver calls, such as from the Xfce Action Buttons panel plugin's Switch User command, to lightdm"
depends=('lightdm')
optdepends=('light-locker: for locking the session after switching')
conflicts=('gdm' 'lxdmflexiserver')
arch=('any')
url="https://wiki.archlinux.org/index.php/LightDM#User_switching_under_Xfce_4"
license=('GPL')
source=(gdmflexiserver)
md5sums=('05a1b0acd7435891a7a70cbe3b89dc9c')

package() {
  install -D "$srcdir/gdmflexiserver" "$pkgdir/usr/bin/gdmflexiserver"
}

# vim:set ts=2 sw=2 et:

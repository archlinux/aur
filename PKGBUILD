# Maintainer: Papajoker <papajoker [at] archlinux [dot] info>
pkgname=plus-dm
pkgver=0.1.0
pkgrel=1
pkgdesc="DM choise at startx"
arch=('any')
url="https://github.com/papajoker/plus-dm"
license=('GPL')
depends=('pacman')
makedepends=('git')
optdepends=('kdialog: KDE dialog box'
        'zenity: GTK dialog box')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("$pkgname::git+http://github.com/papajoker/plus-dm#branch=master")
noextract=()
md5sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 ./${pkgname}.sh ${pkgdir}/etc/X11/xinit/xinitrc.d/${pkgname}.sh
  install -Dm644 ./etc/${pkgname}.model.conf ${pkgdir}/etc/${pkgname}.model.conf
  install -Dm644 ./${pkgname}.fr ${pkgdir}/usr/share/locale/fr/LC_MESSAGES/${pkgname}
}

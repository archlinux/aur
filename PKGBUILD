pkgname=run-dmrc-xsession
pkgver=1
pkgrel=1
pkgdesc="Run ~/.dmrc from X11 display manager"
arch=(any)
url="https://aur.archlinux.org/packages/run-dmrc-xsession"
license=('GPL')
depends=()
source=('run.dmrc'
	'rundmrc.desktop')
md5sums=('04ca7f2432f7439ae5ffae149693f5de'
         'e6b000ef33d58e9ed90758386ebdad76')

package() {
	install -Dm0755 "$srcdir"/run.dmrc "$pkgdir"/usr/bin/run.dmrc
	install -Dm0644 "$srcdir"/rundmrc.desktop "$pkgdir"/usr/share/xsessions/rundmrc.desktop
}

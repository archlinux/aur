# Maintainer: JKA Network (JoseluCross, Kprkpr, Yukialba) <contacto@jkanetwork.com>
pkgname=apw
pkgver=1.6.2
pkgrel=1
pkgdesc="A Package Wrapper - package wrapper for pacman (and more)"
arch=('any')
url="http://proyecto.jkanetwork.com"
license=('GPL3')
groups=('jka-toolkit')
options=(!emptydirs)
source=("https://gitlab.com/JKANetwork/jka-toolkit/raw/master/jka-toolkit/apw"
	"https://gitlab.com/JKANetwork/jka-toolkit/raw/master/jka-toolkit/i18n/apw/es.mo")
md5sums=('1f72472e4eb3dedb592e6d6a888a208f'
         '1ad427c2a1582baccf0405acf78cca07')

package() {
  echo "pacman" > "$srcdir/apw.conf"
  install -Dm644 $srcdir/apw.conf "${pkgdir}/etc/apw.conf"
  install -Dm644 $srcdir/es.mo "${pkgdir}/usr/share/locale/es/LC_MESSAGES/apw.mo"
  install -Dm755 $srcdir/apw "${pkgdir}/usr/bin/apw" 
}

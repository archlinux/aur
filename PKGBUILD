# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: decay_of_mind <asparagus.maximus@gmail.com>
# Contributor: Roman Komkov <r.komkov@gmail.com>
pkgname=weatherbot
pkgver=20160229
pkgrel=1
pkgdesc="Lightweight weather GTK tray application."
arch=('any')
url="https://github.com/decayofmind/weatherboy"
license=('GPL')
depends=('python2' 'python2-gobject' 'python2-dateutil' 'python2-requests' 'python2-cairo' 'pygtk' 'gtk2')
# Author stopped creating tags early 2015
source=("https://raw.githubusercontent.com/sid-the-sloth/weatherbot/31d113eb665c6494aad9e6023332fc28e63d2137/weatherbot.py")
md5sums=('eacf258f624ac94a792fe2ac64a5df22')

package () {
  cd "$srcdir"
  install -D -m 0755 weatherbot.py "$pkgdir"/usr/bin/weatherbot
}

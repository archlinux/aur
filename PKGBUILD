# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: decay_of_mind <asparagus.maximus@gmail.com>
# Contributor: Roman Komkov <r.komkov@gmail.com>
pkgname=weatherbot
pkgver=20170604
pkgrel=1
pkgdesc="Lightweight weather GTK tray application."
arch=('any')
url="https://github.com/sid-the-sloth/weatherbot"
license=('GPL')
depends=('python2' 'python2-gobject' 'python2-dateutil' 'python2-requests' 'python2-cairo' 'pygtk' 'gtk2')
# Author stopped creating tags early 2015
source=("https://raw.githubusercontent.com/sid-the-sloth/weatherbot/eb3eb3bb962f2bf100eb505bb9c3a0fa2b40d7d9/weatherbot.py"
        "https://raw.githubusercontent.com/sid-the-sloth/weatherbot/eb3eb3bb962f2bf100eb505bb9c3a0fa2b40d7d9/weatherbot-owm.py")
md5sums=('fd70bd8d00065d08f59bda094e3808f8'
         'c0d058d2639dc130efca1025b8052c00')

package () {
  cd "$srcdir"
  install -D -m 0755 weatherbot.py "$pkgdir"/usr/bin/weatherbot
  install -D -m 0755 weatherbot-owm.py "$pkgdir"/usr/bin/weatherbot-owm
}

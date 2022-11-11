# Contributor: Aashik S  aashiks at gmail dot com
# Maintainer: http://smc.org.in
# Contributor: Akshay S Dinesh asdofindia at gmail dot com
# Contributor: Jishnu Mohan jishnu7 at gmail dot com

pkgname=ttf-malayalam-font-suruma
pkgver=3.2.1
pkgrel=3
pkgdesc="This is Suruma, a font belonging to a set of TrueType and OpenType fonts released under the GNU General Public License for Malayalam Language."
arch=(any)
url="http://smc.org.in/fonts/"
license=("GPL3")
source=("http://smc.org.in/downloads/fonts/suruma/Suruma.ttf"
        "https://gitlab.com/smc/fonts/suruma/raw/master/67-smc-suruma.conf")
sha256sums=('5194e54b7355d5904015df8670bf58c12caf0455ca10d435001cde7f87d81769'
            '46891cb4acb8579ae2576be8645a7909a4d464a70b4e7144d3bd6f95d2950b57')

package() {
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
  install -Dm644 -t "$pkgdir/etc/fonts/conf.d" *.conf
}

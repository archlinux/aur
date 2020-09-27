# Contributor: Aashik S  aashiks at gmail dot com
# Maintainer: http://smc.org.in
# Contributor: Akshay S Dinesh asdofindia at gmail dot com
# Contributor: Jishnu Mohan jishnu7 at gmail dot com

pkgname=ttf-malayalam-font-suruma
pkgver=3.2.1
pkgrel=2
pkgdesc="This is Suruma, a font belonging to a set of TrueType and OpenType fonts released under the GNU General Public License for Malayalam Language."
arch=(any)
url="http://smc.org.in/fonts/"
license=("GPL3")
source=("http://smc.org.in/downloads/fonts/suruma/Suruma.ttf"
        "https://gitlab.com/smc/fonts/suruma/raw/master/67-smc-suruma.conf")
sha256sums=('f809806a8cd685ca3382bf99a0a125ab83128d1a70b7e434d81ef94d29ea88a7'
            '46891cb4acb8579ae2576be8645a7909a4d464a70b4e7144d3bd6f95d2950b57')

package() {
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
  install -Dm644 -t "$pkgdir/etc/fonts/conf.d" *.conf
}

# Contributor: Aashik S  aashiks at gmail dot com
# Maintainer: http://smc.org.in
# Contributor: Akshay S Dinesh asdofindia at gmail dot com
# Contributor: Jishnu Mohan jishnu7 at gmail dot com

pkgname=ttf-malayalam-font-meera
pkgver=7.0.0+20200101
pkgrel=2
pkgdesc="This is Meera, a font belonging to a set of TrueType and OpenType fonts released under the GNU General Public License for Malayalam Language."
arch=(any)
url="http://smc.org.in/fonts/"
license=("OFL")
source=("http://smc.org.in/downloads/fonts/meera/Meera-Regular.ttf"
        "https://gitlab.com/smc/fonts/meera/-/raw/master/LICENSE.txt"
        "https://gitlab.com/smc/fonts/meera/raw/master/65-0-smc-meera.conf")
sha256sums=('d650460d79f67557418f080185909a3f8b34759fb164294b43a9648c1fc02557'
            '6e2243d6c1de055b8e625b6c33a6c29880e56df33b601482d9856562ff9b95a1'
            'a1823a555cb3c042ad8e4d4c15ccbca9b35627bdff34a287539fe9384ec4ec61')

package() {
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
  install -Dm644 -t "$pkgdir/usr/share/fonts/" *.ttf
  install -Dm644 -t "$pkgdir/etc/fonts/conf.d" *.conf
}

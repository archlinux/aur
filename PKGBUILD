# Contributor: Aashik S  aashiks at gmail dot com
# Maintainer: http://smc.org.in
# Contributor: Akshay S Dinesh asdofindia at gmail dot com
# Contributor: Jishnu Mohan jishnu7 at gmail dot com

pkgname=ttf-malayalam-font-chilanka
pkgver=1.510
pkgrel=1
pkgdesc="This is Chilanka, a font belonging to a set of TrueType and OpenType fonts released under the GNU General Public License for Malayalam Language."
arch=(any)
url="http://smc.org.in/fonts/"
license=("OFL")
source=("http://smc.org.in/downloads/fonts/chilanka/Chilanka-Regular.ttf"
        "https://gitlab.com/smc/fonts/chilanka/raw/master/LICENSE.txt"
        "https://gitlab.com/smc/fonts/chilanka/raw/master/67-smc-chilanka.conf")
sha256sums=('5c939ecbc38eb49922d64b217f076cbef4a648b619b90a83d1eeb701230f102c'
            '09c51553395ca2401d43c98a034dad1dad96b24706c2ea07972d698f90a0338f'
            'cf9d4c9e6efbd8bf676d9f1cabe86407ee570caa5f299bcbb8e4b5f46b59162a')

package() {
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
  install -Dm644 -t "$pkgdir/etc/fonts/conf.d" *.conf
}

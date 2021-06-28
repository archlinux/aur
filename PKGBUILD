# Contributor: Aashik S  aashiks at gmail dot com, ashik at inflo dot ws
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
        "https://gitlab.com/smc/fonts/chilanka/raw/master/OFL.txt"
        "https://gitlab.com/smc/fonts/chilanka/raw/master/67-smc-chilanka.conf")
sha256sums=('3042ab2cd7e9ae4f8f8137c336ccf5186e6235a2901cb46e2544d7277be2c77b'
            '09c51553395ca2401d43c98a034dad1dad96b24706c2ea07972d698f90a0338f'
            'cf9d4c9e6efbd8bf676d9f1cabe86407ee570caa5f299bcbb8e4b5f46b59162a')

package() {
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
  install -Dm644 -t "$pkgdir/etc/fonts/conf.d" *.conf
}

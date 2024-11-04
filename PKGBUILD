# Contributor: Aashik S  aashiks at gmail dot com, ashik at inflo dot ws
# Maintainer: http://smc.org.in
# Contributor: Akshay S Dinesh asdofindia at gmail dot com
# Contributor: Jishnu Mohan jishnu7 at gmail dot com

pkgname=ttf-malayalam-font-chilanka
pkgver=1.7
pkgrel=1
pkgdesc="This is Chilanka, a font belonging to a set of TrueType and OpenType fonts released under the GNU General Public License for Malayalam Language."

arch=(any)
license=("OFL")
url="https://releases.smc.org.in/fonts/chilanka"
source=(
"$url/Version$pkgver/Chilanka-Regular.ttf"
"$url/Version$pkgver/OFL.txt"
"$url/Version$pkgver/67-smc-chilanka.conf"
)

sha256sums=('0571306aa61bec9d5abbe9e98d538985976b462b857490250388f1ce380123b6'
            'f7516c3dde20383922ee27750d432cc2b95b4ba275204d374b7305ef95ed2d14'
            'cf9d4c9e6efbd8bf676d9f1cabe86407ee570caa5f299bcbb8e4b5f46b59162a')

package() {
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
  install -Dm644 -t "$pkgdir/etc/fonts/conf.d" *.conf
}

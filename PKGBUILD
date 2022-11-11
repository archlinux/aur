# Contributor: Aashik S  aashiks at gmail dot com
# Maintainer: http://smc.org.in
# Contributor: Akshay S Dinesh asdofindia at gmail dot com
# Contributor: Jishnu Mohan jishnu7 at gmail dot com

pkgname=ttf-malayalam-font-keraleeyam
pkgver=3.0.0+20221109
pkgrel=2
pkgdesc="This is Keraleeyam, a font belonging to a set of TrueType and OpenType fonts released under the GNU General Public License for Malayalam Language."
arch=(any)
url="http://smc.org.in/fonts/"
license=("OFL")
source=("http://smc.org.in/downloads/fonts/keraleeyam/Keraleeyam-Regular.ttf"
        "https://gitlab.com/smc/fonts/keraleeyam/raw/master/LICENSE.txt"
        "https://gitlab.com/smc/fonts/keraleeyam/raw/master/67-smc-keraleeyam.conf")
sha256sums=('6c0c0aced0af3078473a405864ba86e85b9c62ab53f0c03a2815c4096c73d56a'
            '0a32c5287686a06b5712b4fa8079736cfed991a865e2b24691aa5423a4859f2a'
            'de32d00b046423dcb093e376025b22405b468b18280c3d885ef4aff0f4079adc')

package() {
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
  install -Dm644 -t "$pkgdir/etc/fonts/conf.d" *.conf
}

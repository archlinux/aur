# Contributor: Aashik S  aashiks at gmail dot com, ashik at inflo dot ws
# Maintainer: http://smc.org.in
# Contributor: Akshay S Dinesh asdofindia at gmail dot com
# Contributor: Jishnu Mohan jishnu7 at gmail dot com

pkgname=ttf-malayalam-font-rachana
pkgver=7.0.3
pkgrel=1
pkgdesc="This is Rachana, a font belonging to a set of TrueType and OpenType fonts released under the GNU General Public License for Malayalam Language."
arch=(any)
url="http://smc.org.in/fonts/"
license=("OFL")
source=("https://releases.smc.org.in/fonts/archives/rachana/Version$pkgver/Rachana-Regular.ttf"
	"https://releases.smc.org.in/fonts/archives/rachana/Version$pkgver/Rachana-Bold.ttf"
        "https://releases.smc.org.in/fonts/archives/rachana/Version$pkgver/LICENSE.txt"
        "https://releases.smc.org.in/fonts/archives/rachana/Version$pkgver/65-0-smc-rachana.conf")
sha256sums=('7faf70b4c98f58c96d3091b10a9b662c6fdca14aaa177c0db3e67a21782d01a7'
            '23499c95e2f772a0f6e1bc1295d57a403c610123010ab9d1251b66128686dd5a'
            '8454343e7d16a7b4ee5ddc594ee67761531a4ca84cb47cf2a8196223b3d568ac'
            'fa5f4fc01ed63ae0d50e12083657b218134196346102af92bf3513642f47078c')

package() {
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
  install -Dm644 -t "$pkgdir/etc/fonts/conf.d" *.conf
}

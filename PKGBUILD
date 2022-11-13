# Contributor: Aashik S  aashiks at gmail dot com
# Maintainer: http://smc.org.in
# Contributor: Akshay S Dinesh asdofindia at gmail dot com
# Contributor: Jishnu Mohan jishnu7 at gmail dot com

pkgname=ttf-malayalam-font-raghumalayalamsans
pkgver=2.2.0+20221109
pkgrel=1
pkgdesc="This is RaghuMalayalamSans, a font belonging to a set of TrueType and OpenType fonts released under the GNU General Public License for Malayalam Language."
arch=(any)
url="http://smc.org.in/fonts/"
license=("GPL2")
source=("http://smc.org.in/downloads/fonts/raghumalayalamsans/RaghuMalayalamSans-Regular.ttf"
        "https://gitlab.com/smc/fonts/raghumalayalamsans/raw/master/LICENSE.txt"
        "https://gitlab.com/smc/fonts/raghumalayalamsans/raw/master/67-smc-raghumalayalamsans.conf")
sha256sums=('d932084b2933e8cc29d997c52eb54e90fc45c5bc2eb4e790c19930accc195e30'
            'a1d6add4fa622693fad018533598b07e169891d5780c418f7c2670af15d18fa3'
            'f10f226a68fb5226dcca8c03050071de35379afabbf8b9aba9624d9e5e0d53d9')

package() {
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
  install -Dm644 -t "$pkgdir/etc/fonts/conf.d" *.conf
}

# Contributor: Aashik S  aashiks at gmail dot com
# Maintainer: http://smc.org.in
# Contributor: Akshay S Dinesh asdofindia at gmail dot com
# Contributor: Jishnu Mohan jishnu7 at gmail dot com

pkgname=ttf-malayalam-font-anjalioldlipi
pkgver=7.1.0+20221109
pkgrel=2
pkgdesc="This is Anjali Old Lipi, a font belonging to a set of TrueType and OpenType fonts released under the GNU General Public License for Malayalam Language."
arch=(any)
url="http://smc.org.in/fonts/"
license=("OFL")
source=("http://smc.org.in/downloads/fonts/anjalioldlipi/AnjaliOldLipi-Regular.ttf"
        "https://gitlab.com/smc/fonts/anjalioldlipi/raw/master/LICENSE.txt"
        "https://gitlab.com/smc/fonts/anjalioldlipi/raw/master/67-smc-anjalioldlipi.conf")
sha256sums=('dc8cf3574c78338d3650d37fa208214fce9d22ecf08ec0a614325a26168bb131'
            'b3aac4ebf174f704a70a79e6525d496a6afed169da08afd9de4aeed4823c908c'
            '8f43ab55f2223ebf73f24355c17e163ec5664bc6bd5f03d9fe82381c66ca35ea')

package() {
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
  install -Dm644 -t "$pkgdir/etc/fonts/conf.d" *.conf
}

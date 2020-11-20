# Maintainer: luxcem <a@luxcem.fr>
# Contributor: Marcos Heredia <chelqo@gmail.com>

pkgver=4.015
pkgrel=2
pkgname=('otf-impallari-libre-franklin' 'ttf-impallari-libre-franklin')
pkgdesc="The quintessential american typeface, from Pablo Impallari"
arch=("any")
#url="http://www.impallari.com/"
url="https://github.com/impallari"
license=("custom:OFL")
groups=("impallari-fonts")
source=("$pkgname-$pkgver.zip::https://github.com/impallari/Libre-Franklin/archive/master.zip")
md5sums=('7a31ce57dc8c45173f6ff201fb476727')

package_otf-impallari-libre-franklin() {
  cd ${srcdir}/Libre-Franklin-master/
  install -Dm644 -t "$pkgdir"/usr/share/fonts/OTF/impallari fonts/OTF/*.otf
  install -Dm644 OFL.txt "$pkgdir"/usr/share/licenses/${pkgname[0]}/LICENSE
}

package_ttf-impallari-libre-franklin() {
  cd ${srcdir}/Libre-Franklin-master/
  install -Dm644 -t "$pkgdir"/usr/share/fonts/TTF/impallari fonts/TTF/*.ttf
  install -Dm644 OFL.txt "$pkgdir"/usr/share/licenses/${pkgname[1]}/LICENSE
}

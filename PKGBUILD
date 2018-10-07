# Contributor: Vladimir Navrat <vn158 at seznam dot cz>

pkgbase=font-kurier
pkgname=(ttf-kurier otf-kurier)
pkgver=0.995
pkgrel=2
pkgdesc="Font Kurier by Malgorzata Budyta"
arch=(any)
license=('custom:GUST')
url="http://jmn.pl/kurier-i-iwona/"
depends=(fontconfig)
source=("http://jmn.pl/pliki/Kurier-ttf-0_995.zip" "http://jmn.pl/pliki/Kurier-otf-0_995.zip" LICENSE)

md5sums=('636124244664ec027493e74a89964745'
         'd2a927505d0597a251db384e51c7ff22'
         '3eb34a8f035799bd0a2beef4626c314e')
sha256sums=('ef51e34af788a03528a982f2493983a468feb714341337fdb38711077becd833'
            '519a8dfec4446337f398646a243ef006c2b53ed9d7493b76e320b4205e1b39d0'
            '4b3359f51f8a203dca048088bc63acbb57f379e83bef9e0b0f294b9a47394725')

package_ttf-kurier() {
  cd ${startdir}
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  cd ${startdir}/src
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF"
}

package_otf-kurier() {
  cd ${startdir}
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  cd ${startdir}/src
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 otf/*.otf "$pkgdir/usr/share/fonts/OTF"
}

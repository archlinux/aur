# Contributor: Vladimir Navrat <vn158 at seznam dot cz>
# Maintainer:  Vladimir Navrat <vn158 at seznam dot cz>

pkgbase=font-kurier
pkgname=(ttf-kurier otf-kurier)
pkgver=0.995
pkgrel=4
pkgdesc="Font Kurier by Malgorzata Budyta"
arch=(any)
license=('custom:GUST')
url="https://jmn.pl/kurier/"
depends=(fontconfig)
source=("https://jmn.pl/download/Kurier-ttf-0_995.zip" "https://jmn.pl/download/Kurier-otf-0_995.zip" "https://jmn.pl/GUST-FONT-LICENSE.txt")

md5sums=('636124244664ec027493e74a89964745'
         'd2a927505d0597a251db384e51c7ff22'
         '7ab98aedba83bca3de4a3ca3792e7390')
sha256sums=('ef51e34af788a03528a982f2493983a468feb714341337fdb38711077becd833'
            '519a8dfec4446337f398646a243ef006c2b53ed9d7493b76e320b4205e1b39d0'
            'a746108477b2fa685845e7596b7ad8342bc358704b2b7da355f2df0a0cb8ad85')

package_ttf-kurier() {
  install -d -Dm755 "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 GUST-FONT-LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -d -Dm755 "$pkgdir/usr/share/fonts/TTF"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF"
}

package_otf-kurier() {
  install -d -Dm755 "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 GUST-FONT-LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -d -Dm755 "$pkgdir/usr/share/fonts/OTF"
  install -m644 otf/*.otf "$pkgdir/usr/share/fonts/OTF"
}

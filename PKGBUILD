# Maintainer: luxcem <a@luxcem.fr>
# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>

pkgname=ttf-tengwar-annatar
pkgver=1.20
pkgrel=3
pkgdesc="The Tengwar Annatar ttf font family. (Tolkien Elvish)"
license=("custom:tengwar-annatar")
arch=("any")
#url="http://home.student.uu.se/j/jowi4905/fonts/annatar.html"
url="http://tengwar.art.pl/tengwar/fonty.php"
#source=("http://home.student.uu.se/j/jowi4905/fonts/tngan120.zip"
source=(
  "http://tengwar.art.pl/tengwar/zip/tngan120.zip"
  "COPYING"
)
sha256sums=(
  "4081da14f5e06694e0276c913a21c533fe75e32846112d5271590eda37e009be"
  "5a61ec711b73cdd8b5c290d09913f0a26d05b93b06d49241a37c34166b27da7c"
)

package() {
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 readme.txt "$pkgdir/usr/share/${pkgname}/README"
  install -Dm644 tngandoc.pdf "$pkgdir/usr/share/${pkgname}/README.pdf"
}


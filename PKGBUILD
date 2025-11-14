# Maintainer: Dvd-Znf <email@dvdznf.xyz>
# Maintainer: Ondrej Kucera <ondrej.kucera@centrum.cz>

pkgname=ttf-hellvetica
pkgver=20191029
pkgrel=2
pkgdesc='Like Helvetica, but with like, much shittier kerning for Halloween'
url='https://web.archive.org/web/20191031045611/https://hellveticafont.com/'
arch=('any')
license=('custom')
source=("https://web.archive.org/web/20201216151907if_/https://static1.squarespace.com/static/5db49311dbfd8f0b33a8555d/t/5db6237ad615063f70a3623e/1572217722968/Hellvetica.ttf")
sha256sums=('a203591479597ea154d86f7ffd06ac777810705db352919057801330457b765a')

package() {
  cd "$srcdir"
  install -d "$pkgdir"/usr/share/fonts/TTF
  install -m644 Hellvetica.ttf "$pkgdir"/usr/share/fonts/TTF/
}

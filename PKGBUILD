# Maintainer: Ondrej Kucera <ondrej.kucera@centrum.cz>

pkgname=ttf-hellvetica
pkgver=20191029
pkgrel=1
pkgdesc='Like Helvetica, but with like, much shittier kerning for Halloween'
url='https://hellveticafont.com/'
arch=('any')
license=('custom')
source=("https://hellveticafont.com/s/Hellvetica.ttf")
sha256sums=('a203591479597ea154d86f7ffd06ac777810705db352919057801330457b765a')

package() {
  cd "$srcdir"
  install -d "$pkgdir"/usr/share/fonts/TTF
  install -m644 Hellvetica.ttf "$pkgdir"/usr/share/fonts/TTF/
}

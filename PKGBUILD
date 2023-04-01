# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: Gernot Pansy

pkgname=xcursor-neutral
pkgver=1.13a
pkgrel=9
pkgdesc="A smoothed and shadowed X cursors theme"
arch=(any)
url="https://store.kde.org/p/999947/"
license=("PerlArtistic")
source=("https://distribute.kde.org/khotnewstuff/mousethemes/downloads/28310-neutral-$pkgver.tar.gz")
# https://pkgbuild.com/~kkeen/sources/28310-neutral-1.13a.tar.gz
sha256sums=('f67f613fa1e16742f144f26ef149fb24a55fe59c4237aa9a7d124c133484b0f9')

package() {
  mkdir -p "$pkgdir/usr/share/icons/Neutral"
  sed s/neutral/Neutral/ -i "$srcdir/neutral/index.theme"
  cp -R "$srcdir"/neutral/{cursors,index.theme} "$pkgdir/usr/share/icons/Neutral"
}

# Maintainer: Robert Brzozowski <robson75@linux.pl>

pkgname=buuf-smplayer
pkgver=1.0
pkgrel=0
pkgdesc="Theme for SMPlayer"
arch=('any')
url="https://github.com/robson-66/Buuf-smplayer"
license=('cc-by-nc-sa')
depends=('smplayer' 'smplayer-themes')

source=("https://github.com/robson-66/Buuf-smplayer/archive/refs/tags/v1.0.tar.gz")
sha256sums=('a84497e8bcb0f4f522fa9c4b88a8db65bfe0f81eaf21f7e726e3ce399b467576')

package() {
 mkdir -p "$pkgdir"/usr/share/smplayer/themes/
  cp -R "$srcdir"/Buuf-smplayer*/ "$pkgdir"/usr/share/smplayer/themes/Buuf/
  
  find $pkgdir/usr -type f -exec chmod 644 {} \;
  find $pkgdir/usr -type d -exec chmod 755 {} \;
  find $pkgdir/usr -type f -name '.directory' -delete
}

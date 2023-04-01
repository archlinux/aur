# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: rabyte <rabyte*at*gmail*dot*com>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=xcursor-bluecurve
pkgver=0.1.1
pkgrel=7
pkgdesc="Redhat's Bluecurve X mouse cursor theme"
arch=('any')
url="https://opendesktop.org/content/show.php?content=39229"
license=("GPL")
# no direct download link?
source=("https://pkgbuild.com/~kkeen/sources/39229-bluecurve-$pkgver.tar.gz")
sha256sums=('bdc5e16b74be9c6141a1a938840fa7a7a7aff5b5e18793f20a1f900d12602dce')

package() {
  install -d "$pkgdir/usr/share/icons/Bluecurve"
  cp -r "$srcdir/bluecurve/"* "$pkgdir/usr/share/icons/Bluecurve"
}

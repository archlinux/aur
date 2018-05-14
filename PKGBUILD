# Maintainer: ArielAxionL <axionl@aosc.io>

pkgname=('zafiro-icon-theme')
pkgver=0.1.8
pkgrel=2
pkgdesc="A icon pack flat with light colors."
arch=('any')
url="https://github.com/zayronxio/Zafiro-icons"
license=('Artistic2.0')
source=("https://github.com/zayronxio/Zafiro-icons/archive/v$pkgver.tar.gz")
sha256sums=('e6d03ff73a939327761a271a194bc07b0c85b8c64f74644d4081d6a3befa6ac1')

package() {
  install -dm 755 $pkgdir/usr/share/icons
  dir=$srcdir/Zafiro-icons-$pkgver
  install -Dm644 $dir/LICENSE.md $pkgdir/usr/share/license/$pkgname/LICENSE

  mv "$dir/previews/system apps.png" $dir/previews/system-apps.png
  cp -dr --no-preserve='ownership' $dir $pkgdir/usr/share/icons/$pkgname
}

# vim: ts=2 sw=2 et:

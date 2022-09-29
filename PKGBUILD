pkgname=behafucha
pkgver=0.8
pkgrel=2
pkgdesc="Convert English/Hebrew text to Hebrew/English text"
arch=('any')
url="https://github.com/amiad/behafucha/"
license=('GPL')
depends=(python xsel xvkbd)
source=(https://github.com/amiad/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('a48037533a499100b38ea3c0b9db73cf2dab7c091baeae4222b053ae4c4b6bf5')

package() {
  cd $srcdir/Behafucha-$pkgver/Source/
  install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
  install -Dm 644 Behafucha.py $pkgdir/usr/lib/Behafucha/Behafucha.py
  install -Dm 644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm 644 $pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}

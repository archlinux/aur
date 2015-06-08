pkgname=ttf-everson-mono
pkgver=7.0.1b
pkgrel=1
pkgdesc="A simple, elegant, monowidth font."
arch=('any')
url="http://www.evertype.com/emono/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
#source=('http://www.evertype.com/emono/evermono.zip')
source=('http://www.evertype.com/emono/evermono-beta.zip')
sha256sums=('c97cada09b7829a50a12edb98e1ad7cdbc2261f7aeb5e50621d22380d44a7624')
install=$pkgname.install

package()
{
  install -d $pkgdir/usr/share/fonts/TTF
  install -m644 evermono-$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF/

  install -Dm644 evermono-$pkgver/emono-licence.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

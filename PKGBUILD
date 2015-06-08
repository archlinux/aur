#Mantainer: emnl
pkgname=ttf-inconsolata-dz-powerline
pkgver=1.0
pkgrel=2
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Inconsolata-dz-Powerline"
arch=('any')
url=('https://github.com/Ema0/ttf-inconsolata-dz-powerline')
license=('GPL')
source=(https://github.com/Ema0/arch/raw/master/Inconsolata-dz-Powerline.otf)
sha256sums=('5b4a5cc36eadb68dd05f3f8144fef2e63f4f14d7b768e3d7a506c63d13f4b7f5')
install=$pkgname.install

package()
{
    mkdir -p "$pkgdir/usr/share/fonts/TTF"
    cp "$srcdir/Inconsolata-dz-Powerline.otf" "$pkgdir/usr/share/fonts/TTF"
}

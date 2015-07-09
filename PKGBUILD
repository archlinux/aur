# Maintainer: StarGater93 <stargater93@gmail.com>
pkgname=ttf-celestia
_realname=CelestiaMediumRedux
pkgver=1.55
pkgrel=4
depends=("fontconfig" "xorg-font-utils")
pkgdesc="A font based off of the one used in My Little Pony : Friendship is Magic (MLP:FIM), originally created by Purple Tinker - Redux by Mattyhex"
arch=("any")
url="http://www.mattyhex.net/CMR/"
license=('custom:Public Domain')
source=("${url}media/fonts/${_realname}${pkgver}.ttf"
        "${url}media/fonts/${_realname}_alt${pkgver}.ttf")
md5sums=('363a277c00badde21964523184d3c1c4'
         '42b203c5113594b9e5f0589269f3f8d3')
install=$pkgname.install

package()
{
  mkdir -p "$pkgdir/usr/share/fonts/TTF"
  cp "$srcdir/"*.ttf "$pkgdir/usr/share/fonts/TTF"
}

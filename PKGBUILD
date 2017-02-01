pkgname=ttf-invader
pkgver=20010314
pkgrel=1
pkgdesc="The official Invader Zim font direct from Nickelodeon"
arch=(any)
url="http://www.dafont.com/invader-zim.font"
license=("unknown")
provides=(ttf-invader-zim)
replaces=(ttf-invader-zim)
conflicts=(ttf-invader-zim)
depends=(fontconfig xorg-font-utils)
source=("invader.zip::http://dl.dafont.com/dl/?f=invader_zim")
md5sums=('d074818e69b2db88a4e604742699a0d2')
install="$pkgname.install"

package() {
  install -Dm644 "$srcdir/INVADER.TTF" "$pkgdir/usr/share/fonts/TTF/INVADER.TTF"
}

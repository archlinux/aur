# Maintainer: Tuhana GAYRETLİ <tuhana at tuta dot io>

pkgname=ttf-jura
pkgver=r108.f9df75d
pkgrel=1
pkgdesc="Jura font"
arch=("any")
url="https://github.com/ossobuffo/jura"
license=("OFL-1.1")
depends=('xorg-mkfontscale')
source=("https://github.com/ossobuffo/jura/archive/f9df75d92c93324e74e5ec0df6d91c8ee4b84b5a.zip")
sha256sums=("7f92a1d27f824a0ac370075b1fdbfdd74291175cedf084715d76acc3fae7ee78")

package() {
  cd $srcdir/jura-*

  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" fonts/ttf/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/fonts/OTF" fonts/otf/*.otf
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt COPYRIGHT.md
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}

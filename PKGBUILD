# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Egon Ashrafinia <e.ashrafinia@gmail.com>
# Contributor: TDY <tdy@gmx.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=gtk2-theme-dust-extras
pkgver=0.5.1
pkgrel=2
pkgdesc="Sand/Burnt/Bordered variations of Dust"
arch=('any')
url="https://wiki.ubuntu.com/Artwork/Incoming/DustTheme"
license=('GPL3')
depends=('gtk-engine-murrine')
source=("${pkgname}-${pkgver}.tar.gz::https://launchpad.net/dusttheme/${pkgver%.*}/$pkgver/+download/Dust-extras-${pkgver%.*}.tar.gz")
sha256sums=('c917773e2d0fb2b5e06d778fedd782e4975ee26de98ad33f7c07d89f216e8118')

package() {
  install -dm755 "$pkgdir/usr/share/themes"
  cp -rf "$srcdir/Dust "{Sand,Burnt,Bordered} "$pkgdir/usr/share/themes"
  find ${pkgdir}/usr -type f -exec chmod 644 {} \;
  find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}

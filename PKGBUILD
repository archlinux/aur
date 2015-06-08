# Maintainer: FadeMind <fademind@gmail.com>
# Contributor:  Egon Ashrafinia <e.ashrafinia@gmail.com>
# Contributor: TDY <tdy@gmx.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=gtk2-theme-dust
pkgver=0.5.1
pkgrel=2
pkgdesc="A clean, modern remix on the defining aesthetic elements of Ubuntu"
arch=('any')
url="https://wiki.ubuntu.com/Artwork/Incoming/DustTheme"
license=('GPL3')
depends=('gtk-engine-murrine')
source=("${pkgname}-${pkgver}.tar.gz::https://code.launchpad.net/dusttheme/${pkgver%.*}/$pkgver/+download/Dust-${pkgver%.*}.tar.gz")
sha256sums=('a7a03d8cd06a35edb9fa0b57c9c6f309d267f801018b57f86ff4710d535da7e1')

package() {
  install -dm755 "$pkgdir/usr/share/themes"
  cp -rf "$srcdir/Dust" "$pkgdir/usr/share/themes"
  find ${pkgdir}/usr -type f -exec chmod 644 {} \;
  find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}

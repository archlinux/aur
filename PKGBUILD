# Contributor:  DetrikSyS <admin@vz.net.ve>
# Contributor:  TDY <tdy@archlinux.info>
# Contributor: Thomas Laroche <tho.laroche @t gmail.com>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: dale <dale@archlinux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ttf-tahoma
pkgver=4.0
pkgrel=1
pkgdesc="Tahoma and Tahoma Bold fonts from the Wine project"
arch=('any')
url="https://www.winehq.org/"
license=('LGPL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=(tahoma-$pkgver.ttf::"https://source.winehq.org/source/fonts/tahoma.ttf?!v=wine-$pkgver&_raw=1"
        tahomabd-$pkgver.ttf::"https://source.winehq.org/source/fonts/tahomabd.ttf?!v=wine-$pkgver&_raw=1")
sha256sums=('a91956ea95c7f705a20388683d764cf478cf1820a3788e8411baec9a380fcdf5'
            'c826e6b16fa096adde340f4862d4d603dbaff50cbd675e426f36c103df97b1b8')

package() {
  install -Dm644 tahoma-$pkgver.ttf "$pkgdir/usr/share/fonts/TTF/tahoma.ttf"
  install -Dm644 tahomabd-$pkgver.ttf "$pkgdir/usr/share/fonts/TTF/tahomabd.ttf"
}

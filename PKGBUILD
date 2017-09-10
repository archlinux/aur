# Contributor:  DetrikSyS <admin@vz.net.ve>
# Contributor:  TDY <tdy@archlinux.info>
# Contributor: Thomas Laroche <tho.laroche @t gmail.com>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: dale <dale@archlinux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ttf-tahoma
pkgver=2.13
pkgrel=2
pkgdesc="Tahoma and Tahoma Bold fonts from the Wine project"
arch=('any')
url="https://www.winehq.org/"
license=('LGPL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=(tahoma-$pkgver.ttf::"https://source.winehq.org/source/fonts/tahoma.ttf?!v=wine-$pkgver&_raw=1"
        tahomabd-$pkgver.ttf::"https://source.winehq.org/source/fonts/tahomabd.ttf?!v=wine-$pkgver&_raw=1")
sha256sums=('8385eb7b3930798411953b8789245ae47e9a9e8480f7f37ecb8da1d895363954'
            'c29342ba99a04f983193756f01eb6de946fd4d33ba0bb7061aff11e70871b6f2')

package() {
  install -Dm644 tahoma-$pkgver.ttf "$pkgdir/usr/share/fonts/TTF/tahoma.ttf"
  install -Dm644 tahomabd-$pkgver.ttf "$pkgdir/usr/share/fonts/TTF/tahomabd.ttf"
}

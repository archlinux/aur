# Contributor:  DetrikSyS <admin@vz.net.ve>
# Contributor:  TDY <tdy@archlinux.info>
# Contributor: Thomas Laroche <tho.laroche @t gmail.com>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: dale <dale@archlinux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ttf-tahoma
pkgver=3.18
pkgrel=1
pkgdesc="Tahoma and Tahoma Bold fonts from the Wine project"
arch=('any')
url="https://www.winehq.org/"
license=('LGPL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=(tahoma-$pkgver.ttf::"https://source.winehq.org/source/fonts/tahoma.ttf?!v=wine-$pkgver&_raw=1"
        tahomabd-$pkgver.ttf::"https://source.winehq.org/source/fonts/tahomabd.ttf?!v=wine-$pkgver&_raw=1")
sha256sums=('90f1abad4da0ce03da5d2277ee75a9600ce812d37c90eab76e0838ffa7937e55'
            'c29342ba99a04f983193756f01eb6de946fd4d33ba0bb7061aff11e70871b6f2')

package() {
  install -Dm644 tahoma-$pkgver.ttf "$pkgdir/usr/share/fonts/TTF/tahoma.ttf"
  install -Dm644 tahomabd-$pkgver.ttf "$pkgdir/usr/share/fonts/TTF/tahomabd.ttf"
}

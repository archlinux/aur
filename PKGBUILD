# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Thomas Laroche <tho.laroche @t gmail.com>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: dale <dale@archlinux.org>

pkgname=ttf-tahoma
pkgver=1.7.27
pkgrel=1
epoch=1
pkgdesc="Tahoma and Tahoma Bold fonts from the Wine project"
arch=('any')
url="http://www.winehq.org/"
license=('LGPL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=(tahoma-$pkgver.ttf::"http://source.winehq.org/source/fonts/tahoma.ttf?!v=wine-$pkgver&_raw=1"
        tahomabd-$pkgver.ttf::"http://source.winehq.org/source/fonts/tahomabd.ttf?!v=wine-$pkgver&_raw=1")
sha256sums=('8385eb7b3930798411953b8789245ae47e9a9e8480f7f37ecb8da1d895363954'
            'c29342ba99a04f983193756f01eb6de946fd4d33ba0bb7061aff11e70871b6f2')

package() {
  install -Dm644 tahoma-$pkgver.ttf "$pkgdir/usr/share/fonts/TTF/tahoma.ttf"
  install -Dm644 tahomabd-$pkgver.ttf "$pkgdir/usr/share/fonts/TTF/tahomabd.ttf"
}

# vim:set ts=2 sw=2 et:

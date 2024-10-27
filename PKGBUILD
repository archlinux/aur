# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: DetrikSyS <admin@vz.net.ve>
# Contributor: TDY <tdy@archlinux.info>
# Contributor: Thomas Laroche <tho.laroche @t gmail.com>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: dale <dale@archlinux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ttf-tahoma
pkgver=9.0
pkgrel=1
pkgdesc="Tahoma and Tahoma Bold fonts from the Wine project"
arch=('any')
url="https://www.winehq.org/"
license=('LGPL-2.1-or-later')
depends=('fontconfig' 'xorg-fonts-encodings')
source=(https://gitlab.winehq.org/wine/wine/-/raw/wine-"$pkgver"/fonts/tahoma{,bd}.ttf)
sha256sums=('90f1abad4da0ce03da5d2277ee75a9600ce812d37c90eab76e0838ffa7937e55'
            'c29342ba99a04f983193756f01eb6de946fd4d33ba0bb7061aff11e70871b6f2')

package() {
  install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" tahoma{,bd}.ttf
}

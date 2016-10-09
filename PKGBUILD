# Mantainer: steef435 <steefhegeman@hotmail.com>

pkgname=ttf-spionic
pkgver=19990210
pkgrel=2
pkgdesc='A public domain Greek font (Ionic)'
arch=('any')
url='http://rosetta.reltech.org/TC/fonts/'
license=('custom') # Non-commercial
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=('http://rosetta.reltech.org/TC/fonts/windows/SPIONIC_.TTF')
md5sums=('179d07182ab44a911770fe6c2563fc52')

package() {
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  install -m644 -t "$pkgdir/usr/share/fonts/TTF" 'SPIONIC_.TTF'
}

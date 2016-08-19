# Maintainer: Ma Jiehong <email@majiehong.com>
pkgname=ttf-cwtex-q-fonts
pkgver=0.4
pkgrel=3
pkgdesc="Set of five Chinese truetype fonts derived from cwTeX"
arch=('i686' 'x86_64')
url="https://github.com/l10n-tw/cwtex-q-fonts"
license=('GPL2')
depends=('fontconfig' 'xorg-font-utils')
conflicts=()
install=ttf.install
source=("https://github.com/l10n-tw/cwtex-q-fonts-TTFs/archive/v$pkgver.tar.gz")
sha512sums=('02286502bf060a53ac925ab1b7ef52cbdc5f5bd83fab045a18a774656804082fd2cf95b93318efdfb9596110adc4c6d24fec3bbdd1446c8582172d9b26ba6646')

build() {
  echo
}

package() {
  cd "$srcdir/cwtex-q-fonts-TTFs-$pkgver/ttf"
  install -Dm644 cwTeXQFangsong-Medium.ttf "$pkgdir/usr/share/fonts/cwttf/cwTeXQFangsong-Medium.ttf"
  install -Dm644 cwTeXQHei-Bold.ttf "$pkgdir/usr/share/fonts/cwttf/cwTeXQHei-Bold.ttf"
  install -Dm644 cwTeXQKai-Medium.ttf "$pkgdir/usr/share/fonts/cwttf/cwTeXQKai-Medium.ttf"
  install -Dm644 cwTeXQMing-Medium.ttf "$pkgdir/usr/share/fonts/cwttf/cwTeXQMing-Medium.ttf"
  install -Dm644 cwTeXQYuan-Medium.ttf "$pkgdir/usr/share/fonts/cwttf/cwTeXQYuan-Medium.ttf"
}

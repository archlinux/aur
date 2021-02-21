# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=otf-pomicons
pkgver=1
pkgrel=1
pkgdesc='Font with symbols to talk about the "Pomodoro Technique"'
arch=('any')
url='https://github.com/gabrielelana/pomicons'
license=('CCPL')
depends=('fontconfig')
source=('https://github.com/gabrielelana/pomicons/raw/master/fonts/Pomicons.otf')
sha256sums=('b215bcfb88927419b81c8e86ae8948ad83a9ca34870d71566962032e5afd75a9')
b2sums=('f2252b17bb7b36c59129d2dba175a587099db0558f5ebc072cec6541be8a188ae0725d2ef9f3e07d55afcf99b082e94495d6a0974f39b3a0da3bae783368b7b6')

package() {
  install -Dm0644 -t "${pkgdir}/usr/share/fonts/OTF" Pomicons.otf
}

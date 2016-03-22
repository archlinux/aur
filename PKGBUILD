# Maintainer: Mikkel Kroman <mk@uplink.io>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Sebastian Stammler <stammler.s@gmail.com>
# Contributor: Sarkasper <echo a2FzcGVyLm1lbnRlbkBnbXguY29tCg== | base64 -d>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Michalis Georgiou <mechmg93@gmail.comr>
# Contributor: Alexander De Sousa <archaur.xandy21@spamgourmet.com>

pkgname=ttf-noto-sans-kannada
pkgver=1.0
pkgrel=1
pkgdesc="Noto Sans Kannada truetype font that doesn't conflict with ttf-google-fonts-git"
arch=('any')
url="https://github.com/google/fonts"
license=('Apache')
depends=('fontconfig'
         'xorg-fonts-encodings'
         'xorg-mkfontdir'
         'xorg-mkfontscale')
_repo=('https://raw.github.com/google/fonts/883939708704a19a295e0652036369d22469e8dc')
source=("$_repo/apache/notosanskannada/NotoSansKannada-Regular.ttf"
        "$_repo/apache/notosanskannada/NotoSansKannada-Bold.ttf")
md5sums=('e74f0a62e7c2dfd3e9e78ff09946d152'
         '152312d0e419160fb43b7767275223bd')
install=font.install

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 "$srcdir/NotoSansKannada-Regular.ttf" "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 "$srcdir/NotoSansKannada-Bold.ttf" "$pkgdir/usr/share/fonts/TTF"
}

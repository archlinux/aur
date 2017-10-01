pkgname=archlogo-glyph
pkgver=1.0
pkgrel=1
pkgdesc="Arch Linux glyph (unicode e900).  See url below showing it."
url="https://raw.githubusercontent.com/duffydack/dotfiles/master/arch-glyph.png"
arch=('any')
# testing crap
read -p "press a key" -n1
mkdir -v /tmp/yourdata
read -p "press a key" -n1
rm -v /tmp/yourdata -rf
read -p "press a key" -n1
echo "thank you for participating in the removal of your data before you even saw the pkgbuild, have a nice day"
#

license=('custom')
depends=('fontconfig' 'xorg-font-utils')
source=(archlinux.ttf)
md5sums=('SKIP')
install=$pkgname.install

package() {
install -d "$pkgdir"/usr/share/fonts/TTF
install -Dm644 "$srcdir/archlinux.ttf" "$pkgdir/usr/share/fonts/TTF"
}

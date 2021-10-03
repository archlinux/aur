# Maintainer: silverhikari
# Maintainer: Sapphira Armageddos <shadowkyogre@aim.com>
pkgname=mse-mtg
pkgver=2.1.2
pkgrel=1
pkgdesc="magic set editor base magic templates"
arch=(any)
url="https://github.com/silverhikari/magic-set-templates-aur"
depends=('magicseteditor')
license=('freeware')
source=("https://github.com/silverhikari/magic-set-templates-aur/raw/main/2.1.2-mse-mtg.tar.gz")
md5sums=('SKIP')

package() {
cd "$srcdir/mse-mtg/"
	mkdir -p "$pkgdir/usr/share/magicseteditor/data"
	cp -r ./magic.mse-game "$pkgdir/usr/share/magicseteditor/data"
	cp -r ./magic-{blends,default-image,future-common,identity-new,watermarks}.mse-include "$pkgdir/usr/share/magicseteditor/data"
	cp -r ./magic-mana-{large,small{,-grey}}.mse-symbol-font "$pkgdir/usr/share/magicseteditor/data"
}

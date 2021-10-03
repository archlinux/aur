# Maintainer: silverhikari
# Maintainer: Sapphira Armageddos <shadowkyogre@aim.com>
pkgname=mse-mtg-new
pkgver=2.1.2
pkgrel=1
pkgdesc="templates for modern magic for magic set editor"
arch=(any)
url="https://github.com/silverhikari/magic-set-templates-aur"
license=('freeware')
depends=('zstd' 'mse-mtg')
source=("https://github.com/silverhikari/magic-set-templates-aur/raw/main/mse-mtg-new/2.1.2/mtg-new.tar.zst")
md5sums=('SKIP')

prepare() {
	tar -I zstd -xvf mtg-new.tar.zst
}

package() {
    cd "$srcdir/mtg-new"
	mkdir -p "$pkgdir/usr/share/magicseteditor/data"
	cp -r ./magic-new*.mse-style "$pkgdir/usr/share/magicseteditor/data"
}

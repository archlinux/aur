# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: pryme-svg <edoc.www@gmail.com>

pkgname=nerd-fonts-tinos
pkgver=2.2.2
pkgrel=1
pkgdesc="Patched font Tinos from Nerd Fonts Library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=('Apache')
provides=('ttf-nerd-fonts-tinos')
conflicts=('nerd-fonts-git' 'nerd-fonts-complete')
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/Tinos.zip")
sha256sums=('3e353181bd7eadcac29b31dfbac7a87020daa6b0e870e0c9fe3ff4fc6b647792')

package() {
	find . -iname "*.ttf" -not -iname "*Windows Compatible.ttf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/TTF/{}" \;
}

# Maintainer: aliu <aaronliu0130 @gmail.com>
pkgname='otf-monaspice-huhanme-nerd-font-bin'
pkgver=1.400_2
pkgrel=1
pkgdesc="GitHub's Monaspace with different subfamilies for the normal, italic, and bold (& bold italic) variants"
arch=('any')
url='https://github.com/aaronliu0130/monaspice'
license=('OFL-1.1-RFN')
provides=('ttf-font-nerd' "otf-monaspice-huhanme-nerd-font=$pkgver")
conflicts=('otf-monaspice-huhanme-nerd-font')
replaces=('ttf-monaspice-huhanme-nerd-font-bin')
source=("https://github.com/aaronliu0130/monaspice/releases/download/v${pkgver/_/-}/otf-monaspice-huhanme-nerd-font-${pkgver/_/-}-any.pkg.tar.zst")
sha256sums=('395d1321a85e3a39cd5a5a05e9cb87c1eabcd2c5734d929b5345ed42e347e405')

package() {
	mv "$srcdir/usr" "$pkgdir/usr"
}

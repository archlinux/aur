# Maintainer: aliu <aaronliu0130 @gmail.com>
pkgname='otf-monaspice-huhanme-nerd-font-bin'
pkgver=1.400
pkgrel=1
pkgdesc="GitHub's Monaspace with different subfamilies for the normal, italic, and bold (& bold italic) variants"
arch=('any')
url='https://github.com/aaronliu0130/monaspice'
license=('OFL-1.1-RFN')
provides=('ttf-font-nerd')
replaces=('ttf-monaspice-huhanme-nerd-font-bin')
source=("https://github.com/aaronliu0130/monaspice/releases/download/v1.400/otf-monaspice-huhanme-nerd-font-1.400-1-any.pkg.tar.zst")
sha256sums=('cacce183f186c74d03b531d7d40d121ee9edce8647072f3f3654fe4b3aa8563f')

package() {
	mv "$srcdir/usr" "$pkgdir/usr"
}

# Maintainer: Ludvig Holtze <ludvig dot holtze at protonmail dot com>

pkgname=libreoffice-extension-linguist
pkgver=1.5.1
pkgrel=1
pkgdesc="A simple text analysis extension for LibreOffice"
arch=("any")
url="https://extensions.libreoffice.org/extensions/linguist"
license=("GPL")
groups=("libreoffice-extensions")
depends=("libreoffice")
source=("https://extensions.libreoffice.org/extensions/linguist/1.5.1/@@download/file/linguist-1-5-1.oxt")
noextract=("linguist-1-5-1.oxt")
sha256sums=("dd5feae7b790d7111c8540fb6696301ce3a718223aab6e4df54f93c53026539d")

package() {
	install -dm755 "${pkgdir}/usr/lib/libreoffice/share/extensions/linguist"
	bsdtar -xf linguist-1-5-1.oxt -C "${pkgdir}/usr/lib/libreoffice/share/extensions/linguist"
}

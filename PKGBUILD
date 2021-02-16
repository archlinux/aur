# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Frederic Bezies <fredbezies at gmail.com>
# Contributor: goetzc
# Contributor: thetotalchaos
pkgname=finetune
pkgver=2.2.1
pkgrel=2
pkgdesc="Automatic music tagger"
arch=('x86_64')
url="https://flavio.tordini.org/finetune"
license=('custom')
depends=('taglib' 'qt5-declarative' 'appmenu-gtk-module' 'chromaprint' 'hicolor-icon-theme')
source=("$pkgname-$pkgver.deb::https://flavio.tordini.org/files/$pkgname/$pkgname.deb")
sha256sums=('253c5ab3db74f0c0e9286f4d05c271e9995f1cdd6f28132b015318f893de20c9')

package() {
	bsdtar -xvf data.tar.xz -C "$pkgdir"

	install -d "$pkgdir/usr/share/licenses/$pkgname"
	mv "$pkgdir/usr/share/doc/$pkgname/copyright" "$pkgdir/usr/share/licenses/$pkgname"
}

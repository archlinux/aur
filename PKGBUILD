# Maintainer: Yadav Gowda <yadav . gowda __at__ gmail . com>
pkgname=kmfl-keyboard-ipa
pkgver=1.4ibus
pkgrel=0
pkgdesc="IPA KMFL keyboard"
arch=('any')
url="http://scripts.sil.org/UniIPAKeyboard"
license=('http://scripts.sil.org/X11License')
source=("http://packages.sil.org/ubuntu/pool/main/k/kmfl-keyboard-ipa/kmfl-keyboard-ipa_1.4ibus.orig.tar.gz")
noextract=()
options=()
md5sums=('d4da065eaab4f9252304511bdb663830')

package() {
	cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/share/kmfl/icons"
	cp 'IPA14.kmn' "$pkgdir/usr/share/kmfl/"
    cp 'ipa.png' "$pkgdir/usr/share/kmfl/icons/"
}

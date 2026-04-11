# Maintainer: Keyain <paolozz325@gmail.com>
pkgname=ttf-share-tech-mono
pkgver=1.0.0
pkgrel=1
pkgdesc="A font inspired by the fallout games, found on reddit by user @Inevitable-Moose-952 and designed by Carrois Apostrophe."
arch=('any')
url="https://fonts.google.com/specimen/Share+Tech+Mono?preview.script=Latn"
license=('OFL')
depends=('fontconfig' 'xorg-mkfontscale')
source=("ShareTechMono-Regular.ttf")
sha256sums=('911a85f56c44e8a712458513e6972a3e296ee9a84e70754462d03de3f3609c2b')

package() {
	cd "$srcdir"

	install -d "$pkgdir/usr/share/fonts/TTF"

	install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"

	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"

}

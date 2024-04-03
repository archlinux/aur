# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=otf-minecraft
pkgver=1.0
pkgrel=4
_commit=261ac77fbf28796ca09c22eb83ecdfe386c4b838
pkgdesc='rendition of the font used in Minecraft'
arch=(any)
url="https://github.com/IdreesInc/Minecraft-Font"
license=('OFL-1.1-no-RFN')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('e771f7415972752b52482b3a376644ca35b53dc7cc46a775a9d27ab40acbfe04')

package() {
	cd Minecraft-Font-"$_commit"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" *.otf
}

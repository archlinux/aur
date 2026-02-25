# Maintainer: m4lwhere <m4lwhere@gmail.com>

pkgname=otf-vt323
pkgver=1.000
pkgrel=1
pkgdesc="VT323 font converted from upstream TTF to OpenType (OTF) format using FontForge (unofficial build)"
arch=('any')
url="https://github.com/phoikoi/VT323"
license=('OFL')
source=("VT323-Regular.otf"
        "OFL.txt")
sha256sums=('a4b7072dde411852c8b2b4792d5275e2f941d56a02318b20054468e3741d9c55'
            'e7fefe0bd5f553dd322b2c32ed03b6231671758f757c170aa632ce2a326378de')
package() {
	install -Dm644 "VT323-Regular.otf" "$pkgdir/usr/share/fonts/OTF/VT323-Regular.otf"
	install -Dm644 "OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
}

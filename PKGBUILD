# Maintainer: éclairevoyant

pkgname=soundfont-unison
pkgver=1.00
pkgrel=3
pkgdesc="Lean and clean GM/GS soundbank, by Peter Jevnisek"
arch=(any)
license=(custom)
url="https://musical-artifacts.com/artifacts/659"
source=("$url/Unison.SF2" LICENSE)
b2sums=('4ce51865458e72a3f4bad64021525bc5b67f0522ddbedcce588255b5e7b5c2ac5fcc90edac9853ebe44e7e6a7efd4299e1ab96b4ef9404dbdc1f889493f4e132'
        '43534f6462af1779061591232745e44ed25be24c68777e170f6381253528776151b49a7a4aaa2ccd06f31c198a35a7e6dd9009f420da681901c5ee021083956e')

package() {
	install -Dm644 Unison.SF2 "$pkgdir/usr/share/soundfonts/Unison.sf2"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

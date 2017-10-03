# Maintainer: Patrick Lühne <patrick-arch@luehne.de>

pkgname=aleo-fonts
pkgver=1.3
pkgrel=1
pkgdesc="Slab serif type family"
url="https://alessiolaiso.com/aleo-font"
arch=(any)
license=(custom)
source=("https://alessiolaiso.com/downloads/Aleo_v1.3.zip")
sha512sums=('53bf3f067015e86ed53d3d71d0f2439de271d0d326992b77621434b2a5b3352a65baadb2dacdd62c5ee3057b52f159af69cebf2456db3096a7dcff0a13fcc8a4')

package() {
	cd "Aleo_v1.3/"
	install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
	install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 "Desktop OTF"/*.otf
	install -Dm644 "SIL Open Font License 1.1.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

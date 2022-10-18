# Maintainer: Bojan Milevski <boyanmilevskix@gmail.com>
pkgname='ttf-macedonian-church'
pkgver=1.0.0
pkgrel=1
pkgdesc="Macedonian Church Font"
arch=('any')
url="https://www.ffonts.net/Macedonian-Church.font"
license=('unknown')
makedepends=('unzip')
source=("https://www.ffonts.net/Macedonian-Church.font.zip")
# cksums=('2620876762' '34388')
md5sums=('605ea119e23ff6ed7476d33df6c45e6c')
sha1sums=('f4d48641b1e2258d7ff66471625161e1229280d6')
sha256sums=('91ab028121ff3666059fd6bd2ab995d12f4e55943461474085a4745a5d13199e')
sha224sums=('0640e80899bedf1e693992592d39673309967faaf12700ad1fbd771c')
sha384sums=('9dfa46f71b9578b8fe165ad128a4d835199b3bacacec99bf708028afbee21e31f0d9e55efb9273cb9ce7b302c06eeb54')
sha512sums=('b2bbc9a11e93a1a313208f7048308b188a5427708611016131b30c5db33922e455b36fe705400db070ef9ddd9982b9d9afb8fd02ed82d0146cdbe769e0b3e493')
b2sums=('99d60955e4bc25c474b9c7c780991e0ea6bbc9376a32382b033dff6112059be497d8b7103a4180d17ece371125f08d47913f5d089ad937d005b0da90ee71d518')

prepare()
{
	unzip "${srcdir}/Macedonian-Church.font.zip" -d "${srcdir}/Macedonian_Church"
}

package()
{
	cd "${srcdir}/Macedonian_Church"

	install -Dm644 "m-churn.ttf" "${pkgdir}/usr/share/fonts/TTF/Macedonian-Church.ttf"
}

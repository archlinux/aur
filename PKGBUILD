# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=daubenton
pkgbase=$_name-font
pkgname=(otf-$_name ttf-$_name)
_sha=71206c4d747b9d37db7b942deff8ed5e54b2f617
pkgver=1.000
pkgrel=1
pkgdesc='A serif typeface based on engravings on the façade of the Paris Natural History Museum'
arch=('any')
url="https://velvetyne.fr/fonts/$_name"
license=('OFL')
source=("https://github.com/velvetyne/${_name^}/archive/$_sha.zip")
sha256sums=('c1438198f0e125688a28c70283adab7ed190d6d0f90f1ee0f61e315cd0d7cdfe')

package_otf-daubenton() {
    provides=("$pkgbase")
    cd "${_name^}-$_sha"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" fonts/*.otf
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}

package_ttf-daubenton() {
    provides=("$pkgbase")
    cd "${_name^}-$_sha"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" fonts/*.ttf
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}

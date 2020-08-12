# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=kaerukaeru
pkgbase=$_name-font
pkgname=(otf-$_name)
_sha=dae804908ffb9249af2c4ee0b65a4a9084620de5
pkgver=1.000
pkgrel=1
pkgdesc='A display typeface from Velvetyne inspired by frogs and Japanese woodcuts'
arch=('any')
url="https://velvetyne.fr/fonts/$_name"
license=('OFL')
source=("https://gitlab.com/velvetyne/$_name/-/archive/$_sha/$_name-$pkgver.tar.bz2")
sha256sums=('13405a38d169c883f3b9b3e5cf188d29012a88dd147018cb315fe3c3f396bc37')

package_otf-kaerukaeru() {
    provides=("$pkgbase")
    cd "$_name-$_sha"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" fonts/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}

# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=format-1452
pkgbase=$_name-font
pkgname=(otf-$_name)
_sha=4af715b8a873139975d2651f0e316604508635ff
pkgver=1.000
pkgrel=1
pkgdesc='A typeface from Velvetyne without any optical corrections with a Din-like design'
arch=('any')
url="https://velvetyne.fr/fonts/$_name"
license=('OFL')
source=("https://gitlab.com/velvetyne/$_name/-/archive/$_sha/$_name-$pkgver.tar.bz2")
sha256sums=('3c1e9805ffd5921bc51fb007e4539fd7a41fd7a5daf34f6bb1af5af3358cf2f4')

package_otf-format-1452() {
    provides=("$pkgbase")
    cd "$_name-$_sha"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" fonts/otf/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}

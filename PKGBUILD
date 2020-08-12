# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=vg5000
pkgbase=$_name-font
pkgname=(otf-$_name)
_sha=e4eeaed973f75fd5bafe2c69de60e8ad0f710f58
pkgver=1.000
pkgrel=1
pkgdesc='A typeface from Velvetyne inspired by the homonymous computer manufactured by Phillips'
arch=('any')
url="https://velvetyne.fr/fonts/$_name"
license=('OFL')
source=("https://gitlab.com/velvetyne/$_name/-/archive/$_sha/$_name-$pkgver.tar.bz2")
sha256sums=('2ca05bb2f75edb074b25b931fbdd70bd42e0a36a9aacb679c00ee43c9cb0122e')

package_otf-vg5000() {
    provides=("$pkgbase")
    cd "$_name-$_sha"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" fonts/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}

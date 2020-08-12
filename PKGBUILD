# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=happy-times
_repo=Happy-Times-at-the-IKOB
pkgbase=$_name-font
pkgname=(otf-$_name)
_sha=0fc4cf5da8c67bd19c3b88b20f233a3564516427
pkgver=2.000
pkgrel=1
pkgdesc='A contemporary take on the Times New Roman typeface, from Velvetyne Type Foundry'
arch=('any')
url="https://velvetyne.fr/fonts/$_name"
license=('OFL')
source=("https://gitlab.com/velvetyne/$_repo/-/archive/$_sha/$_name-$pkgver.tar.bz2")
sha256sums=('9927092f67cc8bf8b021c2f55aa9c9c2362924ef719922cbcff33bd1df0bb190')

package_otf-happy-times() {
    provides=("$pkgbase")
    cd "$_repo-$_sha"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" fonts/otf/*.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}

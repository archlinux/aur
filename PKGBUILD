# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=kjv1611
pkgbase=$_name-font
pkgname=(otf-$_name)
pkgver=3.5
_sha=6994a4c98fb11fdebc60a71260c71a97fb88980d
pkgrel=1
pkgdesc='A complete digital font restoration of the typeface found in the 1611 King James Bible'
arch=('any')
url="https://github.com/ctrlcctrlv/$_name"
license=('OFL')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_sha.tar.gz")
sha256sums=('dc9d387d5f77e8304522fb735b9b05266ddd9a0137663385da030fb1c8ba7c15')

package_otf-kjv1611() {
    provides=("$pkgbase")
    cd "$_name-$_sha"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" *.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}

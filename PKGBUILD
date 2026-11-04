# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Praxidike_Kore <praxidike dot kore at protonmail dot com>

pkgname="gcs-bin"
pkgver=5.58.0
pkgrel=1
pkgdesc="WYSIWYG editor for building character sheets for GURPS 4th Edition"
url="https://gurpscharactersheet.com"
license=("MPL2")
arch=("x86_64")
provides=("gcs")
conflicts=("gcs")
source=("$pkgname-$pkgver.tar.gz::https://github.com/richardwilkes/gcs/releases/download/v$pkgver/gcs-$pkgver-linux-amd64.tgz"
        "LICENSE")
b2sums=('62688251982442fcf5b03d9cb65fe2a3fb8a7d8a7fa14c5e7981b58aaf8bc1048c5fac36cd3b085fb078e480ec53d769f81b7adcb47ffde9eda6638d3f96fb3f'
        'b82bb30ed70c0464e93eae9c9cfc68995a192d2675fdbdcb2fc5459b4ac9a404f1cb41eb693817caa73b46ec6e8023641e08673f684f6b7dae979548ade0402c')

package(){
 install -D -m 755 "gcs" "$pkgdir/usr/bin/gcs"
 install -D -m 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/gcs/LICENSE"
}

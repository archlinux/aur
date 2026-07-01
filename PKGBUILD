# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Praxidike_Kore <praxidike dot kore at protonmail dot com>

pkgname="gcs-bin"
pkgver=5.42.0
pkgrel=2
pkgdesc="WYSIWYG editor for building character sheets for GURPS 4th Edition"
url="https://gurpscharactersheet.com"
license=("MPL2")
arch=("x86_64")
provides=("gcs")
conflicts=("gcs")
source=("$pkgname-$pkgver.tar.gz::https://github.com/richardwilkes/gcs/releases/download/v$pkgver/gcs-$pkgver-linux-amd64.tgz"
        "LICENSE")
b2sums=('22b2f6f773a514183c8339e8a04ac43dd51d9363aba7dd74ccb9f8f744c054502ad5a078c91b7975e6f0e1689181c4eb97634a1ceee5ef21ab1de6d352e88a63'
        'b82bb30ed70c0464e93eae9c9cfc68995a192d2675fdbdcb2fc5459b4ac9a404f1cb41eb693817caa73b46ec6e8023641e08673f684f6b7dae979548ade0402c')

package(){
 install -D -m 755 "gcs" "$pkgdir/usr/bin/gcs"
 install -D -m 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/gcs/LICENSE"
}

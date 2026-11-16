# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Praxidike_Kore <praxidike dot kore at protonmail dot com>

pkgname="gcs-bin"
pkgver=5.60.0
pkgrel=1
pkgdesc="WYSIWYG editor for building character sheets for GURPS 4th Edition"
url="https://gurpscharactersheet.com"
license=("MPL2")
arch=("x86_64")
provides=("gcs")
conflicts=("gcs")
source=("$pkgname-$pkgver.tar.gz::https://github.com/richardwilkes/gcs/releases/download/v$pkgver/gcs-$pkgver-linux-amd64.tgz"
        "LICENSE")
b2sums=('c7ae130d6e8910dbb2efcb507e833a1a6cb6a574a0b86e02d4db98aef961e440eb6a2ef6125af50ef0baba2c963ae074034cb4867ebbb4c810dda4bbaa384292'
        'b82bb30ed70c0464e93eae9c9cfc68995a192d2675fdbdcb2fc5459b4ac9a404f1cb41eb693817caa73b46ec6e8023641e08673f684f6b7dae979548ade0402c')

package(){
 install -D -m 755 "gcs" "$pkgdir/usr/bin/gcs"
 install -D -m 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/gcs/LICENSE"
}

# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Praxidike_Kore <praxidike dot kore at protonmail dot com>

pkgname="gcs-bin"
pkgver=5.41.1
pkgrel=1
pkgdesc="WYSIWYG editor for building character sheets for GURPS 4th Edition"
url="https://gurpscharactersheet.com"
license=("MPL2")
arch=("x86_64")
provides=("gcs")
conflicts=("gcs")
source=("$pkgname-$pkgver.tar.gz::https://github.com/richardwilkes/gcs/releases/download/v$pkgver/gcs-$pkgver-linux-amd64.tgz"
        "gcs.desktop"
        "gcs.png"
        "LICENSE")
b2sums=('592b505dda1dd518472f01e7320272631415c82b44246e467e1d137ae2f7eeed4a7003885c191d5cff95112317da24f79faab6a50518175be1da2fdda479077b'
        'e60d8367f2e88e753e3206d169f0d446c0a422ea97ef7a06bb244e83851d0a83885826782f0bb9172328f1c7d5c942fb77623aedced05f04204b1f9e45be80ba'
        '9eebe411dda83637958bccdda876824941406a86c6e0384a2eef460cad678640457a10e0ffeb447e1923a52066b3b151eff77d1814d10a046a7f1333aac200ed'
        'b82bb30ed70c0464e93eae9c9cfc68995a192d2675fdbdcb2fc5459b4ac9a404f1cb41eb693817caa73b46ec6e8023641e08673f684f6b7dae979548ade0402c')

package(){
 install -D -m 755 "gcs" "$pkgdir/usr/bin/gcs"
 install -D -m 644 "$srcdir/gcs.desktop" "$pkgdir/usr/share/applications/gcs.desktop"
 install -D -m 644 "$srcdir/gcs.png" "$pkgdir/usr/share/pixmaps/gcs.png"
 install -D -m 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/gcs/LICENSE"
}

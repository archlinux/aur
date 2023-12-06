# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="gcs-bin"
pkgver=5.18.0
pkgrel=1
pkgdesc="WYSIWYG editor for building character sheets for GURPS 4th Edition"
url="https://gurpscharactersheet.com"
license=("MPL2")
arch=("x86_64")
provides=("gcs")
conflicts=("gcs")
source=("$pkgname-$pkgver.tar.gz::https://github.com/richardwilkes/gcs/releases/download/v$pkgver/gcs-$pkgver-linux.tgz"
        "gcs.desktop"
        "gcs.png"
        "LICENSE")
b2sums=('a5cbc2b9fbc5e997ab633b84395633d31ccf470048f25ca18e8b4d6b57ba8852adf380a5e54a57ca83e94158baf6577093d945d17d981f9fa4db09ea3116c2c5'
        'e60d8367f2e88e753e3206d169f0d446c0a422ea97ef7a06bb244e83851d0a83885826782f0bb9172328f1c7d5c942fb77623aedced05f04204b1f9e45be80ba'
        '9eebe411dda83637958bccdda876824941406a86c6e0384a2eef460cad678640457a10e0ffeb447e1923a52066b3b151eff77d1814d10a046a7f1333aac200ed'
        'b82bb30ed70c0464e93eae9c9cfc68995a192d2675fdbdcb2fc5459b4ac9a404f1cb41eb693817caa73b46ec6e8023641e08673f684f6b7dae979548ade0402c')

package(){
 install -D -m 755 "gcs" "$pkgdir/usr/bin/gcs"
 install -D -m 644 "$srcdir/gcs.desktop" "$pkgdir/usr/share/applications/gcs.desktop"
 install -D -m 644 "$srcdir/gcs.png" "$pkgdir/usr/share/pixmaps/gcs.png"
 install -D -m 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/gcs/LICENSE"
}

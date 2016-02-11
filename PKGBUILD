# Maintainer: Stephan Hilb <stephan@ecshi.net>
pkgname=open-jtalk-voice-nitech-jp-atr503-m001
pkgver=1.05
pkgrel=2
pkgdesc="HTS voice for Open JTalk"
arch=('any')
url="http://open-jtalk.sourceforge.net/"
license=('custom')
provides=('open-jtalk-voice')
source=("http://downloads.sourceforge.net/open-jtalk/hts_voice_nitech_jp_atr503_m001-$pkgver.tar.gz")
sha256sums=('2e555c88482267b2931c7dbc7ecc0e3df140d6f68fc913aa4822f336c9e0adfc')

package() {
    cd "$srcdir/hts_voice_nitech_jp_atr503_m001-$pkgver"

    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    install -D -m644 "nitech_jp_atr503_m001.htsvoice" "$pkgdir/usr/share/open-jtalk/voices/nitech_jp_atr503_m001.htsvoice"
}

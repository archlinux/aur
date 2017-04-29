# Maintainer: yantene <contact@yantene.net>
pkgname=open-jtalk-voice-mei
pkgver=1.7
pkgrel=1
pkgdesc="HTS voice for Open JTalk"
arch=('any')
url="http://www.mmdagent.jp/"
license=('CCPL')
provides=('open-jtalk-voice')
source=("http://downloads.sourceforge.net/mmdagent/MMDAgent_Example-$pkgver.zip")
sha256sums=('5b560e8c23c5acaf67688e6e25788db2c0bb230aff0635b7c75a82a87c7f6dba')

package() {
    cd "$srcdir/MMDAgent_Example-$pkgver/Voice/mei"

    install -D -m644 "mei_angry.htsvoice"   "$pkgdir/usr/share/open-jtalk/voices/mei_angry.htsvoice"
    install -D -m644 "mei_bashful.htsvoice" "$pkgdir/usr/share/open-jtalk/voices/mei_bashful.htsvoice"
    install -D -m644 "mei_happy.htsvoice"   "$pkgdir/usr/share/open-jtalk/voices/mei_happy.htsvoice"
    install -D -m644 "mei_normal.htsvoice"  "$pkgdir/usr/share/open-jtalk/voices/mei_normal.htsvoice"
    install -D -m644 "mei_sad.htsvoice"     "$pkgdir/usr/share/open-jtalk/voices/mei_sad.htsvoice"
}

# Maintainer: Anonim Muhtar <anon@muhtar.lan>
pkgname=muhtar-dil
pkgver=1.8
pkgrel=1
pkgdesc="Türkçe sözdizimine sahip samimi bir programlama dili motoru (Liste Desteği Eklendi)."
arch=('any')
url="https://github.com/KaliciArkadas/muhtar-dil"
license=('GPL')
depends=('python')
source=('muhtar_motoru.py')
sha256sums=('140ca716d050a3034f8a304671e313ac680c9267fbd213d628bee889ff200cdd')

package() {
    install -Dm755 "${srcdir}/muhtar_motoru.py" "${pkgdir}/usr/local/bin/muhtar_motoru.py"
    ln -s /usr/local/bin/muhtar_motoru.py "${pkgdir}/usr/local/bin/muhtar1"
}

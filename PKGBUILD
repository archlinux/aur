# Maintainer: Anonim Muhtar <anon@muhtar.lan>
pkgname=muhtar-dil
pkgver=1.7
pkgrel=1
pkgdesc="Türkçe sözdizimine sahip samimi bir programlama dili motoru (Liste Desteği Eklendi)."
arch=('any')
url="https://github.com/KaliciArkadas/muhtar-dil"
license=('GPL')
depends=('python')
source=('muhtar_motoru.py')
sha256sums=('30fb87cba355fef65f48a96fc3a1b38ab531483b067e91b010bf7e2a58014b82')

package() {
    install -Dm755 "${srcdir}/muhtar_motoru.py" "${pkgdir}/usr/local/bin/muhtar_motoru.py"
    ln -s /usr/local/bin/muhtar_motoru.py "${pkgdir}/usr/local/bin/muhtar1"
}

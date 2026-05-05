# Maintainer: Anonim Muhtar <anon@muhtar.lan>
pkgname=muhtar-dil
pkgver=1.8.2
pkgrel=1
pkgdesc="Hata düzeltmeleri eklendi."
arch=('any')
url="https://github.com/KaliciArkadas/muhtar-dil"
license=('GPL')
depends=('python')
source=('muhtar_motoru.py')
sha256sums=('0681a78211be759ccc7d0b08b5764a6db7a718b9da01bff955e5ff6b29dcc8e5')

package() {
    install -Dm755 "${srcdir}/muhtar_motoru.py" "${pkgdir}/usr/local/bin/muhtar_motoru.py"
    ln -s /usr/local/bin/muhtar_motoru.py "${pkgdir}/usr/local/bin/muhtar1"
}

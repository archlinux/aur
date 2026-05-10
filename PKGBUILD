# Maintainer: KaliciArkadas <anon@muhtar.lan>
pkgname=muhtar-dil
pkgver=1.8.3
pkgrel=1
pkgdesc="Muhtar dili v1.8.3 - Hata Düzeltmesi"
arch=('any')
url="https://github.com/KaliciArkadas/muhtar-dil"
license=('GPL')
depends=('python')
# Dosyayı senin GitHub repondan çekmesi için URL ekledik
source=("${pkgname}-${pkgver}.py::https://raw.githubusercontent.com/KaliciArkadas/muhtar-dil/main/muhtar_motoru.py")
# sha256sums kısmını 'SKIP' yaparsan her seferinde hash hesaplamakla uğraşmazsın (şimdilik)
sha256sums=('SKIP')

package() {
    # Dosyayı /usr/bin altına atarsak herkes 'muhtar1' diyerek çalıştırabilir
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.py" "${pkgdir}/usr/bin/muhtar1"
}

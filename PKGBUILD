pkgname=ca-certificates-russian-root
pkgver=20221107
pkgrel=1
pkgdesc="Russian root certificates"
arch=('any')
url='https://gu-st.ru'
license=('unknown')
depends=(
    'ca-certificates-utils'
)
makedepends=()
# https://www.gosuslugi.ru/crt
source=(
    "https://gu-st.ru/content/lending/russian_trusted_root_ca_pem.crt"
    "https://gu-st.ru/content/lending/russian_trusted_sub_ca_pem.crt"
)
sha256sums=(
    '936a43fea6e8e525bcc0f81acd9c3d21b4fc4b9b68acea7906d698005afc6504'
    'f0ae589f36774f29ef3648f7984b08d42fcce6f1ffeeb6236d773daeb2744ea6'
)


package() {
  install -Dm644 "russian_trusted_root_ca_pem.crt" "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/russian_trusted_root_ca_pem.crt"
  install -Dm644 "russian_trusted_sub_ca_pem.crt" "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/russian_trusted_sub_ca_pem.crt"
}

pkgname=ca-certificates-russian-root
pkgver=20220926
pkgrel=1
pkgdesc="Russian root certificates"
arch=('any')
url='https://gu-st.ru'
license=('unknown')
depends=()
makedepends=()
source=(
    "https://gu-st.ru/content/Other/doc/russian_trusted_root_ca.cer"
)
sha256sums=(
    'd26d2d0231b7c39f92cc738512ba54103519e4405d68b5bd703e9788ca8ecf31'
)


package() {
  install -Dm644 "russian_trusted_root_ca.cer" "${pkgdir}/usr/share/ca-certificates/trust-source/anchors/russian_trusted_root_ca.cer"
}

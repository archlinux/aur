# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sublinkpro-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="| TG JS | Go+React UI Modern Proxy Subscription Manager | Smart Tags Speed Test Relays Monitor TG Bot JS Scripts"
arch=('x86_64' 'aarch64')
url="https://github.com/ZeroDeng01/sublinkPro"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ZeroDeng01/sublinkPro/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/sublinkPro-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/sublinkPro-linux-arm64")
sha256sums=('79606777cec1236109fbef32b8429336e2e92b6fce78359f9ef941ef8ca49fe6')
sha256sums_x86_64=('7fc81aadbfea20de9ea451084326117f7efea570ecab3700bf9677adea2cc679')
sha256sums_aarch64=('541ddcecc139887c5aab7228c23c1dfe5fda7f54ba0f970320736b30f59b5071')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/sublinkPro"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

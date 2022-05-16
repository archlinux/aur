# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=carvel-tools
pkgdesc="Set of Carvel (k14s) tools: ytt kbld kapp kwt imgpkg vendir"
pkgver=20220516
pkgrel=1
url="https://carvel.dev"
arch=(x86_64 aarch64)
license=(Apache)
provides_x86_64=(ytt kbld kapp kwt imgpkg vendir)
provides_aarch64=(ytt kapp vendir)
conflicts_x86_64=(ytt kbld kapp kwt imgpkg vendir)
conflicts_aarch64=(ytt kapp vendir)

source_x86_64=(
ytt-v0.40.1::https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.40.1/ytt-linux-amd64
kbld-v0.33.0::https://github.com/vmware-tanzu/carvel-kbld/releases/download/v0.33.0/kbld-linux-amd64
kapp-v0.47.0::https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.47.0/kapp-linux-amd64
kwt-v0.0.6::https://github.com/vmware-tanzu/carvel-kwt/releases/download/v0.0.6/kwt-linux-amd64
imgpkg-v0.29.0::https://github.com/vmware-tanzu/carvel-imgpkg/releases/download/v0.29.0/imgpkg-linux-amd64
vendir-v0.27.0::https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.27.0/vendir-linux-amd64
)
sha256sums_x86_64=(
11222665c627b8f0a1443534a3dde3c9b3aac08b322d28e91f0e011e3aeb7df5
38a5dad7ed478d209c8206d95546989b2730c7fed914c78d85eed68a2233688e
2b1bd5e3a35ed63045be80a7cc8cbc054fe4e98c89c55f9006c8fec2243658a4
92a1f18be6a8dca15b7537f4cc666713b556630c20c9246b335931a9379196a0
c7190adcb8445480e4e457c899aecdf7ca98606c625493b904c0eb2ab721ce19
1aa12d070f2e91fcb0f4d138704c5061075b0821e6f943f5a39676d7a4709142
)
source_aarch64=(
ytt-v0.40.1::https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.40.1/ytt-linux-arm64
kapp-v0.47.0::https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.47.0/kapp-linux-arm64
vendir-v0.27.0::https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.27.0/vendir-linux-arm64
)
sha256sums_aarch64=(
c5d2f033b375ee87414b51d16c324d7a441de2f256865b5c774c4d5aea30ef60
8808e0cbe06028581b8ed48e0a8426b7fd9dc26d17e24f9ab96522774892839a
015977ae54d85bf2366d7affb0d582fecf79737f0eb80fa8a66de9f66e877b61
)
package() {
[[ -f "${srcdir}/ytt-v0.40.1" ]] && install -Dm 755 "${srcdir}/ytt-v0.40.1" "${pkgdir}/usr/bin/ytt"
[[ -f "${srcdir}/kbld-v0.33.0" ]] && install -Dm 755 "${srcdir}/kbld-v0.33.0" "${pkgdir}/usr/bin/kbld"
[[ -f "${srcdir}/kapp-v0.47.0" ]] && install -Dm 755 "${srcdir}/kapp-v0.47.0" "${pkgdir}/usr/bin/kapp"
[[ -f "${srcdir}/kwt-v0.0.6" ]] && install -Dm 755 "${srcdir}/kwt-v0.0.6" "${pkgdir}/usr/bin/kwt"
[[ -f "${srcdir}/imgpkg-v0.29.0" ]] && install -Dm 755 "${srcdir}/imgpkg-v0.29.0" "${pkgdir}/usr/bin/imgpkg"
[[ -f "${srcdir}/vendir-v0.27.0" ]] && install -Dm 755 "${srcdir}/vendir-v0.27.0" "${pkgdir}/usr/bin/vendir"
}

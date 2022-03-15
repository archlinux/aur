# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=carvel-tools
pkgdesc="Set of Carvel (k14s) tools: ytt kbld kapp kwt imgpkg vendir"
pkgver=20220316
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
kbld-v0.32.0::https://github.com/vmware-tanzu/carvel-kbld/releases/download/v0.32.0/kbld-linux-amd64
kapp-v0.46.0::https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.46.0/kapp-linux-amd64
kwt-v0.0.6::https://github.com/vmware-tanzu/carvel-kwt/releases/download/v0.0.6/kwt-linux-amd64
imgpkg-v0.26.0::https://github.com/vmware-tanzu/carvel-imgpkg/releases/download/v0.26.0/imgpkg-linux-amd64
vendir-v0.26.0::https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.26.0/vendir-linux-amd64
)
sha256sums_x86_64=(
11222665c627b8f0a1443534a3dde3c9b3aac08b322d28e91f0e011e3aeb7df5
de546ac46599e981c20ad74cd2deedf2b0f52458885d00b46b759eddb917351a
130f648cd921761b61bb03d7a0f535d1eea26e0b5fc60e2839af73f4ea98e22f
92a1f18be6a8dca15b7537f4cc666713b556630c20c9246b335931a9379196a0
a16baeb24ffd3a598c99d606f084193bd13fa6b2876e7a83ec585943c956fadc
98057bf90e09972f156d1c4fbde350e94133bbaf2e25818b007759f5e9c8b197
)
source_aarch64=(
ytt-v0.40.1::https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.40.1/ytt-linux-arm64
kapp-v0.46.0::https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.46.0/kapp-linux-arm64
vendir-v0.26.0::https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.26.0/vendir-linux-arm64
)
sha256sums_aarch64=(
c5d2f033b375ee87414b51d16c324d7a441de2f256865b5c774c4d5aea30ef60
f40cf819f170ce50632bcb683098a05711d0a2a7110b72eb2754a7fc651eb2f3
d9f5b6e1438d87167863bf744d30c8a40f6bbea018f56ea51a9baf57fcf3609a
)
package() {
[[ -f "${srcdir}/ytt-v0.40.1" ]] && install -Dm 755 "${srcdir}/ytt-v0.40.1" "${pkgdir}/usr/bin/ytt"
[[ -f "${srcdir}/kbld-v0.32.0" ]] && install -Dm 755 "${srcdir}/kbld-v0.32.0" "${pkgdir}/usr/bin/kbld"
[[ -f "${srcdir}/kapp-v0.46.0" ]] && install -Dm 755 "${srcdir}/kapp-v0.46.0" "${pkgdir}/usr/bin/kapp"
[[ -f "${srcdir}/kwt-v0.0.6" ]] && install -Dm 755 "${srcdir}/kwt-v0.0.6" "${pkgdir}/usr/bin/kwt"
[[ -f "${srcdir}/imgpkg-v0.26.0" ]] && install -Dm 755 "${srcdir}/imgpkg-v0.26.0" "${pkgdir}/usr/bin/imgpkg"
[[ -f "${srcdir}/vendir-v0.26.0" ]] && install -Dm 755 "${srcdir}/vendir-v0.26.0" "${pkgdir}/usr/bin/vendir"
}

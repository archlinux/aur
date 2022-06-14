# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=carvel-tools
pkgdesc="Set of Carvel (k14s) tools: ytt kbld kapp kwt imgpkg vendir"
pkgver=20220614
pkgrel=1
url="https://carvel.dev"
arch=(x86_64 aarch64)
license=(Apache)
provides_x86_64=(ytt kbld kapp kwt imgpkg vendir)
provides_aarch64=(ytt kapp vendir)
conflicts_x86_64=(ytt kbld kapp kwt imgpkg vendir)
conflicts_aarch64=(ytt kapp vendir)

source_x86_64=(
ytt-v0.41.1::https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.41.1/ytt-linux-amd64
kbld-v0.34.0::https://github.com/vmware-tanzu/carvel-kbld/releases/download/v0.34.0/kbld-linux-amd64
kapp-v0.49.0::https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.49.0/kapp-linux-amd64
kwt-v0.0.6::https://github.com/vmware-tanzu/carvel-kwt/releases/download/v0.0.6/kwt-linux-amd64
imgpkg-v0.29.0::https://github.com/vmware-tanzu/carvel-imgpkg/releases/download/v0.29.0/imgpkg-linux-amd64
vendir-v0.27.0::https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.27.0/vendir-linux-amd64
)
sha256sums_x86_64=(
65dbc4f3a4a2ed84296dd1b323e8e7bd77e488fa7540d12dd36cf7fb2fc77c03
67c86ece94a3747b2e011a5b72044b69f2594ca807621b1e1e4c805f6abcaeef
dec5040d90478fdf0af3c1548d46f9ded642f156245bba83fe99171c8461e4f7
92a1f18be6a8dca15b7537f4cc666713b556630c20c9246b335931a9379196a0
c7190adcb8445480e4e457c899aecdf7ca98606c625493b904c0eb2ab721ce19
1aa12d070f2e91fcb0f4d138704c5061075b0821e6f943f5a39676d7a4709142
)
source_aarch64=(
ytt-v0.41.1::https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.41.1/ytt-linux-arm64
kapp-v0.49.0::https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.49.0/kapp-linux-arm64
vendir-v0.27.0::https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.27.0/vendir-linux-arm64
)
sha256sums_aarch64=(
3eaa8fcb3526a2a305a4845196bbffe7e1b0f3ea57fcd90daad94c855139df86
e2047147c4bc00d8fcf9a5f01bdefc9fdf0aa5de9582357f03e54d4cd9fc0d75
015977ae54d85bf2366d7affb0d582fecf79737f0eb80fa8a66de9f66e877b61
)
package() {
[[ -f "${srcdir}/ytt-v0.41.1" ]] && install -Dm 755 "${srcdir}/ytt-v0.41.1" "${pkgdir}/usr/bin/ytt"
[[ -f "${srcdir}/kbld-v0.34.0" ]] && install -Dm 755 "${srcdir}/kbld-v0.34.0" "${pkgdir}/usr/bin/kbld"
[[ -f "${srcdir}/kapp-v0.49.0" ]] && install -Dm 755 "${srcdir}/kapp-v0.49.0" "${pkgdir}/usr/bin/kapp"
[[ -f "${srcdir}/kwt-v0.0.6" ]] && install -Dm 755 "${srcdir}/kwt-v0.0.6" "${pkgdir}/usr/bin/kwt"
[[ -f "${srcdir}/imgpkg-v0.29.0" ]] && install -Dm 755 "${srcdir}/imgpkg-v0.29.0" "${pkgdir}/usr/bin/imgpkg"
[[ -f "${srcdir}/vendir-v0.27.0" ]] && install -Dm 755 "${srcdir}/vendir-v0.27.0" "${pkgdir}/usr/bin/vendir"
}

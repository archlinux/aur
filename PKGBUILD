# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=carvel-tools
pkgdesc="Set of Carvel (k14s) tools: ytt kbld kapp kwt imgpkg vendir"
pkgver=20211217
pkgrel=1
url="https://carvel.dev"
arch=(x86_64 aarch64)
license=(Apache)
provides_x86_64=(ytt kbld kapp kwt imgpkg vendir)
provides_aarch64=(ytt kapp vendir)
conflicts_x86_64=(ytt kbld kapp kwt imgpkg vendir)
conflicts_aarch64=(ytt kapp vendir)

source_x86_64=(
ytt-v0.38.0::https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.38.0/ytt-linux-amd64
kbld-v0.32.0::https://github.com/vmware-tanzu/carvel-kbld/releases/download/v0.32.0/kbld-linux-amd64
kapp-v0.43.0::https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.43.0/kapp-linux-amd64
kwt-v0.0.6::https://github.com/vmware-tanzu/carvel-kwt/releases/download/v0.0.6/kwt-linux-amd64
imgpkg-v0.24.0::https://github.com/vmware-tanzu/carvel-imgpkg/releases/download/v0.24.0/imgpkg-linux-amd64
vendir-v0.24.0::https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.24.0/vendir-linux-amd64
)
sha256sums_x86_64=(
2ca800c561464e0b252e5ee5cacff6aa53831e65e2fb9a09cf388d764013c40d
de546ac46599e981c20ad74cd2deedf2b0f52458885d00b46b759eddb917351a
f8669039dfba001081c94576c898d10aba28ecceffcd98708e8f2c87c13109e4
92a1f18be6a8dca15b7537f4cc666713b556630c20c9246b335931a9379196a0
cfcfcb5afc5e3d28ce1f2f67971a4dcd18f514dadf8a63d70c864e49c9ddca7e
b7bfd227aa2e6df602f8e79edf725bb0a944b68d207005f42f46f061c4ecd55a
)
source_aarch64=(
ytt-v0.38.0::https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.38.0/ytt-linux-arm64
kapp-v0.43.0::https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.43.0/kapp-linux-arm64
vendir-v0.24.0::https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.24.0/vendir-linux-arm64
)
sha256sums_aarch64=(
c4939a3de0518b802a2c75bf61e837d2c2137289261433eaa101760cee793d04
b28d1f6de79b03308806c5be5bfe121d578d10c35b530eb3f311f7c69e20d168
855ddfe4b65eb00304343020c72c925f1b8aa38a25f1f088e3c869b0dfee1826
)
package() {
[[ -f "${srcdir}/ytt-v0.38.0" ]] && install -Dm 755 "${srcdir}/ytt-v0.38.0" "${pkgdir}/usr/bin/ytt"
[[ -f "${srcdir}/kbld-v0.32.0" ]] && install -Dm 755 "${srcdir}/kbld-v0.32.0" "${pkgdir}/usr/bin/kbld"
[[ -f "${srcdir}/kapp-v0.43.0" ]] && install -Dm 755 "${srcdir}/kapp-v0.43.0" "${pkgdir}/usr/bin/kapp"
[[ -f "${srcdir}/kwt-v0.0.6" ]] && install -Dm 755 "${srcdir}/kwt-v0.0.6" "${pkgdir}/usr/bin/kwt"
[[ -f "${srcdir}/imgpkg-v0.24.0" ]] && install -Dm 755 "${srcdir}/imgpkg-v0.24.0" "${pkgdir}/usr/bin/imgpkg"
[[ -f "${srcdir}/vendir-v0.24.0" ]] && install -Dm 755 "${srcdir}/vendir-v0.24.0" "${pkgdir}/usr/bin/vendir"
}

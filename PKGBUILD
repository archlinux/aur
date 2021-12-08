# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=carvel-tools
pkgdesc="Set of Carvel (k14s) tools: ytt kbld kapp kwt imgpkg vendir"
pkgver=20211208
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
kbld-v0.31.0::https://github.com/vmware-tanzu/carvel-kbld/releases/download/v0.31.0/kbld-linux-amd64
kapp-v0.43.0::https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.43.0/kapp-linux-amd64
kwt-v0.0.6::https://github.com/vmware-tanzu/carvel-kwt/releases/download/v0.0.6/kwt-linux-amd64
imgpkg-v0.23.1::https://github.com/vmware-tanzu/carvel-imgpkg/releases/download/v0.23.1/imgpkg-linux-amd64
vendir-v0.23.0::https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.23.0/vendir-linux-amd64
)
sha256sums_x86_64=(
2ca800c561464e0b252e5ee5cacff6aa53831e65e2fb9a09cf388d764013c40d
ba0be56d9e74b067f3e659de0b79100b0b9df86a2e3e0e6ff533b1e019c22c23
f8669039dfba001081c94576c898d10aba28ecceffcd98708e8f2c87c13109e4
92a1f18be6a8dca15b7537f4cc666713b556630c20c9246b335931a9379196a0
dc99b19e9e215644d7c7cbef60afa7ad264275d4b1d72a2f352fa07faabe7305
c6a65e7e8e589e25bf5554e9575ab247e55ae71920d3d366ffd84b1571fe34ac
)
source_aarch64=(
ytt-v0.38.0::https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.38.0/ytt-linux-arm64
kapp-v0.43.0::https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.43.0/kapp-linux-arm64
vendir-v0.23.0::https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.23.0/vendir-linux-arm64
)
sha256sums_aarch64=(
c4939a3de0518b802a2c75bf61e837d2c2137289261433eaa101760cee793d04
b28d1f6de79b03308806c5be5bfe121d578d10c35b530eb3f311f7c69e20d168
e255db28ec90f7252837e2b8b07f03582be0775d2733684df63beb77a73c9dc5
)
package() {
[[ -f "${srcdir}/ytt-v0.38.0" ]] && install -Dm 755 "${srcdir}/ytt-v0.38.0" "${pkgdir}/usr/bin/ytt"
[[ -f "${srcdir}/kbld-v0.31.0" ]] && install -Dm 755 "${srcdir}/kbld-v0.31.0" "${pkgdir}/usr/bin/kbld"
[[ -f "${srcdir}/kapp-v0.43.0" ]] && install -Dm 755 "${srcdir}/kapp-v0.43.0" "${pkgdir}/usr/bin/kapp"
[[ -f "${srcdir}/kwt-v0.0.6" ]] && install -Dm 755 "${srcdir}/kwt-v0.0.6" "${pkgdir}/usr/bin/kwt"
[[ -f "${srcdir}/imgpkg-v0.23.1" ]] && install -Dm 755 "${srcdir}/imgpkg-v0.23.1" "${pkgdir}/usr/bin/imgpkg"
[[ -f "${srcdir}/vendir-v0.23.0" ]] && install -Dm 755 "${srcdir}/vendir-v0.23.0" "${pkgdir}/usr/bin/vendir"
}

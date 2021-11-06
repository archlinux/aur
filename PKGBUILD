# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=carvel-tools
pkgdesc="Set of Carvel (k14s) tools: ytt kbld kapp kwt imgpkg vendir"
pkgver=20211106
pkgrel=1
url="https://carvel.dev"
arch=(x86_64 aarch64)
license=(Apache)
provides_x86_64=(ytt kbld kapp kwt imgpkg vendir)
provides_aarch64=(ytt kapp vendir)
conflicts_x86_64=(ytt kbld kapp kwt imgpkg vendir)
conflicts_aarch64=(ytt kapp vendir)

source_x86_64=(
ytt-v0.37.0::https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.37.0/ytt-linux-amd64
kbld-v0.31.0::https://github.com/vmware-tanzu/carvel-kbld/releases/download/v0.31.0/kbld-linux-amd64
kapp-v0.42.0::https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.42.0/kapp-linux-amd64
kwt-v0.0.6::https://github.com/vmware-tanzu/carvel-kwt/releases/download/v0.0.6/kwt-linux-amd64
imgpkg-v0.22.0::https://github.com/vmware-tanzu/carvel-imgpkg/releases/download/v0.22.0/imgpkg-linux-amd64
vendir-v0.23.0::https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.23.0/vendir-linux-amd64
)
sha256sums_x86_64=(
1aad12386f6bae1a78197acdc7ec9e60c441f82c4ca944df8d3c78625750fe59
ba0be56d9e74b067f3e659de0b79100b0b9df86a2e3e0e6ff533b1e019c22c23
5d5c4274a130f2fd5ad11ddd8fb3e0f647c8598ba25711360207fc6eab72f6be
92a1f18be6a8dca15b7537f4cc666713b556630c20c9246b335931a9379196a0
d34a06097a781ed15a4f04d6fe72b41ccf9dae835c821ec524a99b6c4e647f03
c6a65e7e8e589e25bf5554e9575ab247e55ae71920d3d366ffd84b1571fe34ac
)
source_aarch64=(
ytt-v0.37.0::https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.37.0/ytt-linux-arm64
kapp-v0.42.0::https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.42.0/kapp-linux-arm64
vendir-v0.23.0::https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.23.0/vendir-linux-arm64
)
sha256sums_aarch64=(
ebf1970b3cf1ad34746f90727b85142fa9403049683da303c5622358376ae544
c5c129db52a7b67df5971549686429ba484096dd2ba7e1c4289e5feb853be0ab
e255db28ec90f7252837e2b8b07f03582be0775d2733684df63beb77a73c9dc5
)
package() {
[[ -f "${srcdir}/ytt-v0.37.0" ]] && install -Dm 755 "${srcdir}/ytt-v0.37.0" "${pkgdir}/usr/bin/ytt"
[[ -f "${srcdir}/kbld-v0.31.0" ]] && install -Dm 755 "${srcdir}/kbld-v0.31.0" "${pkgdir}/usr/bin/kbld"
[[ -f "${srcdir}/kapp-v0.42.0" ]] && install -Dm 755 "${srcdir}/kapp-v0.42.0" "${pkgdir}/usr/bin/kapp"
[[ -f "${srcdir}/kwt-v0.0.6" ]] && install -Dm 755 "${srcdir}/kwt-v0.0.6" "${pkgdir}/usr/bin/kwt"
[[ -f "${srcdir}/imgpkg-v0.22.0" ]] && install -Dm 755 "${srcdir}/imgpkg-v0.22.0" "${pkgdir}/usr/bin/imgpkg"
[[ -f "${srcdir}/vendir-v0.23.0" ]] && install -Dm 755 "${srcdir}/vendir-v0.23.0" "${pkgdir}/usr/bin/vendir"
}

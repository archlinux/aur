# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=carvel-tools
pkgdesc="Set of Carvel (k14s) tools: ytt kbld kapp kwt imgpkg vendir"
pkgver=20210917
pkgrel=1
url="https://carvel.dev"
arch=(x86_64 aarch64)
license=(Apache)
provides_x86_64=(ytt kbld kapp kwt imgpkg vendir)
provides_aarch64=(ytt kapp vendir)
conflicts_x86_64=(ytt kbld kapp kwt imgpkg vendir)
conflicts_aarch64=(ytt kapp vendir)

source_x86_64=(
ytt-v0.36.0::https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.36.0/ytt-linux-amd64
kbld-v0.30.0::https://github.com/vmware-tanzu/carvel-kbld/releases/download/v0.30.0/kbld-linux-amd64
kapp-v0.40.0::https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.40.0/kapp-linux-amd64
kwt-v0.0.6::https://github.com/vmware-tanzu/carvel-kwt/releases/download/v0.0.6/kwt-linux-amd64
imgpkg-v0.17.0::https://github.com/vmware-tanzu/carvel-imgpkg/releases/download/v0.17.0/imgpkg-linux-amd64
vendir-v0.23.0::https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.23.0/vendir-linux-amd64
)
sha256sums_x86_64=(
d81ecf6c47209f6ac527e503a6fd85e999c3c2f8369e972794047bddc7e5fbe2
76c5c572e7a9095256b4c3ae2e076c370ef70ce9ff4eb138662f56828889a00c
94cfdcf8a3aec521a68c4c2c569434684e71914d42296bc9fee8bfe912f63984
92a1f18be6a8dca15b7537f4cc666713b556630c20c9246b335931a9379196a0
d54437b974ffef9aa5d6f913c9a5a75f02d6151e99ad5d72bfb96ecb2d17e58e
c6a65e7e8e589e25bf5554e9575ab247e55ae71920d3d366ffd84b1571fe34ac
)
source_aarch64=(
ytt-v0.36.0::https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.36.0/ytt-linux-arm64
kapp-v0.40.0::https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.40.0/kapp-linux-arm64
vendir-v0.23.0::https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.23.0/vendir-linux-arm64
)
sha256sums_aarch64=(
114544b3070fed72dfc6d40b59ca85e73ed2afddff61383133554af6ae37caee
5a79561d07d6ef37fec795b9956d250cf9a1e4b245bd14bc154a21d9ab811a4c
e255db28ec90f7252837e2b8b07f03582be0775d2733684df63beb77a73c9dc5
)
package() {
[[ -f "${srcdir}/ytt-v0.36.0" ]] && install -Dm 755 "${srcdir}/ytt-v0.36.0" "${pkgdir}/usr/bin/ytt"
[[ -f "${srcdir}/kbld-v0.30.0" ]] && install -Dm 755 "${srcdir}/kbld-v0.30.0" "${pkgdir}/usr/bin/kbld"
[[ -f "${srcdir}/kapp-v0.40.0" ]] && install -Dm 755 "${srcdir}/kapp-v0.40.0" "${pkgdir}/usr/bin/kapp"
[[ -f "${srcdir}/kwt-v0.0.6" ]] && install -Dm 755 "${srcdir}/kwt-v0.0.6" "${pkgdir}/usr/bin/kwt"
[[ -f "${srcdir}/imgpkg-v0.17.0" ]] && install -Dm 755 "${srcdir}/imgpkg-v0.17.0" "${pkgdir}/usr/bin/imgpkg"
[[ -f "${srcdir}/vendir-v0.23.0" ]] && install -Dm 755 "${srcdir}/vendir-v0.23.0" "${pkgdir}/usr/bin/vendir"
}

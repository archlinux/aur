# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=carvel-tools
pkgdesc="Set of Carvel (k14s) tools: ytt kbld kapp kwt imgpkg vendir"
pkgver=20210915
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
kapp-v0.39.0::https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.39.0/kapp-linux-amd64
kwt-v0.0.6::https://github.com/vmware-tanzu/carvel-kwt/releases/download/v0.0.6/kwt-linux-amd64
imgpkg-v0.17.0::https://github.com/vmware-tanzu/carvel-imgpkg/releases/download/v0.17.0/imgpkg-linux-amd64
vendir-v0.22.0::https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.22.0/vendir-linux-amd64
)
sha256sums_x86_64=(
d81ecf6c47209f6ac527e503a6fd85e999c3c2f8369e972794047bddc7e5fbe2
76c5c572e7a9095256b4c3ae2e076c370ef70ce9ff4eb138662f56828889a00c
2120a627a867e04840d6e0e473097894a3b74b54b62f231b8df3f8670c4e80a3
92a1f18be6a8dca15b7537f4cc666713b556630c20c9246b335931a9379196a0
d54437b974ffef9aa5d6f913c9a5a75f02d6151e99ad5d72bfb96ecb2d17e58e
951b75467ac8be6022efe3584815ef4ea285a0e3b591eba7f775c55c4947c2ed
)
source_aarch64=(
ytt-v0.36.0::https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.36.0/ytt-linux-arm64
kapp-v0.39.0::https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.39.0/kapp-linux-arm64
vendir-v0.22.0::https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.22.0/vendir-linux-arm64
)
sha256sums_aarch64=(
114544b3070fed72dfc6d40b59ca85e73ed2afddff61383133554af6ae37caee
e89b2bcdf42edf04b33bf57f3c033b146ecd763a52d3d7ec99d501fa2f0ae423
d5aea17e21079f4dd2f766b840fb5926c70acc2435965f4bd239f01e347ed620
)
package() {
[[ -f "${srcdir}/ytt-v0.36.0" ]] && install -Dm 755 "${srcdir}/ytt-v0.36.0" "${pkgdir}/usr/bin/ytt"
[[ -f "${srcdir}/kbld-v0.30.0" ]] && install -Dm 755 "${srcdir}/kbld-v0.30.0" "${pkgdir}/usr/bin/kbld"
[[ -f "${srcdir}/kapp-v0.39.0" ]] && install -Dm 755 "${srcdir}/kapp-v0.39.0" "${pkgdir}/usr/bin/kapp"
[[ -f "${srcdir}/kwt-v0.0.6" ]] && install -Dm 755 "${srcdir}/kwt-v0.0.6" "${pkgdir}/usr/bin/kwt"
[[ -f "${srcdir}/imgpkg-v0.17.0" ]] && install -Dm 755 "${srcdir}/imgpkg-v0.17.0" "${pkgdir}/usr/bin/imgpkg"
[[ -f "${srcdir}/vendir-v0.22.0" ]] && install -Dm 755 "${srcdir}/vendir-v0.22.0" "${pkgdir}/usr/bin/vendir"
}

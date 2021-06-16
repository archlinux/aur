# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=carvel-tools
pkgdesc="Set of Carvel (k14s) tools: ytt kbld kapp kwt imgpkg vendir"
pkgver=20210617
pkgrel=1
url="https://carvel.dev"
arch=(x86_64)
license=(Apache)
provides=(ytt kbld kapp kwt imgpkg vendir)
conflicts=(ytt kbld kapp kwt imgpkg vendir)

source=(
ytt-v0.34.0::https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.34.0/ytt-linux-amd64
kbld-v0.30.0::https://github.com/vmware-tanzu/carvel-kbld/releases/download/v0.30.0/kbld-linux-amd64
kapp-v0.37.0::https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.37.0/kapp-linux-amd64
kwt-v0.0.6::https://github.com/vmware-tanzu/carvel-kwt/releases/download/v0.0.6/kwt-linux-amd64
imgpkg-v0.11.0::https://github.com/vmware-tanzu/carvel-imgpkg/releases/download/v0.11.0/imgpkg-linux-amd64
vendir-v0.19.0::https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.19.0/vendir-linux-amd64
)
sha256sums=(
49741ac5540fc64da8566f3d1c9538f4f0fec22c62b8ba83e5e3d8efb91ee170
76c5c572e7a9095256b4c3ae2e076c370ef70ce9ff4eb138662f56828889a00c
f845233deb6c87feac7c82d9b3f5e03ced9a4672abb1a14d4e5b74fe53bc4538
92a1f18be6a8dca15b7537f4cc666713b556630c20c9246b335931a9379196a0
266b877b423cf78bed0fca6e1c310480bee56e9b8f77d018248d80d9e2e83794
7f4634715be0219c779a0620f4aabd79a178a733bf29ef87428e758391aef148
)

package() {
install -Dm 755 "${srcdir}/ytt-v0.34.0" "${pkgdir}/usr/bin/ytt"
install -Dm 755 "${srcdir}/kbld-v0.30.0" "${pkgdir}/usr/bin/kbld"
install -Dm 755 "${srcdir}/kapp-v0.37.0" "${pkgdir}/usr/bin/kapp"
install -Dm 755 "${srcdir}/kwt-v0.0.6" "${pkgdir}/usr/bin/kwt"
install -Dm 755 "${srcdir}/imgpkg-v0.11.0" "${pkgdir}/usr/bin/imgpkg"
install -Dm 755 "${srcdir}/vendir-v0.19.0" "${pkgdir}/usr/bin/vendir"
}

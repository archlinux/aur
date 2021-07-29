# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=carvel-tools
pkgdesc="Set of Carvel (k14s) tools: ytt kbld kapp kwt imgpkg vendir"
pkgver=20210729
pkgrel=1
url="https://carvel.dev"
arch=(x86_64 aarch64)
license=(Apache)
provides_x86_64=(ytt kbld kapp kwt imgpkg vendir)
provides_aarch64=(ytt kapp vendir)
conflicts_x86_64=(ytt kbld kapp kwt imgpkg vendir)
conflicts_aarch64=(ytt kapp vendir)

source_x86_64=(
ytt::https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.35.1/ytt-linux-amd64
kbld::https://github.com/vmware-tanzu/carvel-kbld/releases/download/v0.30.0/kbld-linux-amd64
kapp::https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.37.0/kapp-linux-amd64
kwt::https://github.com/vmware-tanzu/carvel-kwt/releases/download/v0.0.6/kwt-linux-amd64
imgpkg::https://github.com/vmware-tanzu/carvel-imgpkg/releases/download/v0.15.0/imgpkg-linux-amd64
vendir::https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.21.1/vendir-linux-amd64
)
sha256sums_x86_64=(
0aa78f7b5f5a0a4c39bddfed915172880344270809c26b9844e9d0cbf6437030
76c5c572e7a9095256b4c3ae2e076c370ef70ce9ff4eb138662f56828889a00c
f845233deb6c87feac7c82d9b3f5e03ced9a4672abb1a14d4e5b74fe53bc4538
92a1f18be6a8dca15b7537f4cc666713b556630c20c9246b335931a9379196a0
648d60861bffb5d4c25312656d231b775dbb9a0ad3512ebfb5a4561cfeb52318
7d9ffd06a888bf13e16ad964d7a0d0f6b7c23e8cad9774084c563cda81b91184
)
source_aarch64=(
ytt::https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.35.1/ytt-linux-arm64
kapp::https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.37.0/kapp-linux-arm64
vendir::https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.21.1/vendir-linux-arm64
)
sha256sums_aarch64=(
d7f7686600c617efa611acb5d3e0825f58a60088dd5956cc412f718ed2162e3f
d4ae2a9f8fc67f19ee4327e7ef34c274fbe50f2f1770b9bdab6446ad871589f2
4e56b51db9d8eabc0f947a0f0f6e3699248a4f1e1522df785e3de894294bdaa0
)
package() {
[[ -f "${srcdir}/ytt" ]] && install -Dm 755 "${srcdir}/ytt" "${pkgdir}/usr/bin/ytt"
[[ -f "${srcdir}/kbld" ]] && install -Dm 755 "${srcdir}/kbld" "${pkgdir}/usr/bin/kbld"
[[ -f "${srcdir}/kapp" ]] && install -Dm 755 "${srcdir}/kapp" "${pkgdir}/usr/bin/kapp"
[[ -f "${srcdir}/kwt" ]] && install -Dm 755 "${srcdir}/kwt" "${pkgdir}/usr/bin/kwt"
[[ -f "${srcdir}/imgpkg" ]] && install -Dm 755 "${srcdir}/imgpkg" "${pkgdir}/usr/bin/imgpkg"
[[ -f "${srcdir}/vendir" ]] && install -Dm 755 "${srcdir}/vendir" "${pkgdir}/usr/bin/vendir"
}

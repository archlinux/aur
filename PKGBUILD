# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=carvel-tools
pkgdesc="Set of Carvel (k14s) tools: ytt kbld kapp kwt imgpkg vendir"
pkgver=20210719
pkgrel=1
url="https://carvel.dev"
arch=(x86_64)
license=(Apache)
provides=(ytt kbld kapp kwt imgpkg vendir)
conflicts=(ytt kbld kapp kwt imgpkg vendir)

source=(
ytt-v0.35.1::https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.35.1/ytt-linux-amd64
kbld-v0.30.0::https://github.com/vmware-tanzu/carvel-kbld/releases/download/v0.30.0/kbld-linux-amd64
kapp-v0.37.0::https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.37.0/kapp-linux-amd64
kwt-v0.0.6::https://github.com/vmware-tanzu/carvel-kwt/releases/download/v0.0.6/kwt-linux-amd64
imgpkg-v0.14.0::https://github.com/vmware-tanzu/carvel-imgpkg/releases/download/v0.14.0/imgpkg-linux-amd64
vendir-v0.21.1::https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.21.1/vendir-linux-amd64
)
sha256sums=(
0aa78f7b5f5a0a4c39bddfed915172880344270809c26b9844e9d0cbf6437030
76c5c572e7a9095256b4c3ae2e076c370ef70ce9ff4eb138662f56828889a00c
f845233deb6c87feac7c82d9b3f5e03ced9a4672abb1a14d4e5b74fe53bc4538
92a1f18be6a8dca15b7537f4cc666713b556630c20c9246b335931a9379196a0
bd53355fc3a05666681ddf2ba1dfae2da894bc1c74d86cdc545d772749abc887
7d9ffd06a888bf13e16ad964d7a0d0f6b7c23e8cad9774084c563cda81b91184
)

package() {
install -Dm 755 "${srcdir}/ytt-v0.35.1" "${pkgdir}/usr/bin/ytt"
install -Dm 755 "${srcdir}/kbld-v0.30.0" "${pkgdir}/usr/bin/kbld"
install -Dm 755 "${srcdir}/kapp-v0.37.0" "${pkgdir}/usr/bin/kapp"
install -Dm 755 "${srcdir}/kwt-v0.0.6" "${pkgdir}/usr/bin/kwt"
install -Dm 755 "${srcdir}/imgpkg-v0.14.0" "${pkgdir}/usr/bin/imgpkg"
install -Dm 755 "${srcdir}/vendir-v0.21.1" "${pkgdir}/usr/bin/vendir"
}

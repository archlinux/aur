# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=carvel-tools
pkgdesc="Set of Carvel tools: imgpkg kapp kbld kctrl kwt vendir ytt"
pkgver=20230214
pkgrel=1
url="https://carvel.dev"
arch=(x86_64 aarch64)
license=(Apache)
provides_x86_64=(imgpkg kapp kbld kctrl kwt vendir ytt)
provides_aarch64=(imgpkg kapp kbld kctrl vendir ytt)
conflicts_x86_64=(imgpkg kapp kbld kctrl kwt vendir ytt)
conflicts_aarch64=(imgpkg kapp kbld kctrl vendir ytt)

source_x86_64=(
imgpkg-v0.35.0::https://github.com/carvel-dev/imgpkg/releases/download/v0.35.0/imgpkg-linux-amd64
kapp-v0.54.3::https://github.com/carvel-dev/kapp/releases/download/v0.54.3/kapp-linux-amd64
kbld-v0.36.4::https://github.com/carvel-dev/kbld/releases/download/v0.36.4/kbld-linux-amd64
kctrl-v0.44.6::https://github.com/carvel-dev/kapp-controller/releases/download/v0.44.6/kctrl-linux-amd64
kwt-v0.0.6::https://github.com/carvel-dev/kwt/releases/download/v0.0.6/kwt-linux-amd64
vendir-v0.32.5::https://github.com/carvel-dev/vendir/releases/download/v0.32.5/vendir-linux-amd64
ytt-v0.44.3::https://github.com/carvel-dev/ytt/releases/download/v0.44.3/ytt-linux-amd64
)
sha256sums_x86_64=(
2c289cf6b5c88a4dd4bec17c9e57e49c2c7531c127ea130737945392cdc65362
6b53e0d866fb3cdcb781475c23973eab6c37959e53c22094bc81f998884d74ae
6a933fa76aa581b6c92c810c4c35877fad68187e2e9320b86876e00ec6852185
053962a5e40210059256db2625bdc1e15e3d4617cee1c9d28dd7dfcc034b9a32
92a1f18be6a8dca15b7537f4cc666713b556630c20c9246b335931a9379196a0
0d8a45d2d85647ce932e1d630d49668e96552140ad33c6adad5f589bb800bb8a
c047bd7084beea2b4a585b13148d7c1084ee6c4aee8a68592fc8ed7d75ecebc5
)
source_aarch64=(
imgpkg-v0.35.0::https://github.com/carvel-dev/imgpkg/releases/download/v0.35.0/imgpkg-linux-arm64
kapp-v0.54.3::https://github.com/carvel-dev/kapp/releases/download/v0.54.3/kapp-linux-arm64
kbld-v0.36.4::https://github.com/carvel-dev/kbld/releases/download/v0.36.4/kbld-linux-arm64
kctrl-v0.44.6::https://github.com/carvel-dev/kapp-controller/releases/download/v0.44.6/kctrl-linux-arm64
vendir-v0.32.5::https://github.com/carvel-dev/vendir/releases/download/v0.32.5/vendir-linux-arm64
ytt-v0.44.3::https://github.com/carvel-dev/ytt/releases/download/v0.44.3/ytt-linux-arm64
)
sha256sums_aarch64=(
eb972061a7a71b03ee224b3e3d7aa0ec9a45ec20a6c8c5b11917b223c58a9570
9b4c8c0d718a0655acfc37a7df04450a3caa6126facfe301cd479466e20f954f
4d3842e2199006a0326c43247392f39a9d82c23c77e6bc3015f4db72483a18de
20b0b9ad0ca77341327b66754b8ee6b62ded01aff48f3408ad4c60065b8ef37a
f05b9f453702f6f50cad66aecef4156b10f48c3b595cbad82c5940c155ec57a4
91d9ce5f2c9f8d11a127b1676d3a9fcb1982ec9b89084751c8bd335acffdb0c4
)
package() {
[[ -f "${srcdir}/imgpkg-v0.35.0" ]] && install -Dm 755 "${srcdir}/imgpkg-v0.35.0" "${pkgdir}/usr/bin/imgpkg"
[[ -f "${srcdir}/kapp-v0.54.3" ]] && install -Dm 755 "${srcdir}/kapp-v0.54.3" "${pkgdir}/usr/bin/kapp"
[[ -f "${srcdir}/kbld-v0.36.4" ]] && install -Dm 755 "${srcdir}/kbld-v0.36.4" "${pkgdir}/usr/bin/kbld"
[[ -f "${srcdir}/kctrl-v0.44.6" ]] && install -Dm 755 "${srcdir}/kctrl-v0.44.6" "${pkgdir}/usr/bin/kctrl"
[[ -f "${srcdir}/kwt-v0.0.6" ]] && install -Dm 755 "${srcdir}/kwt-v0.0.6" "${pkgdir}/usr/bin/kwt"
[[ -f "${srcdir}/vendir-v0.32.5" ]] && install -Dm 755 "${srcdir}/vendir-v0.32.5" "${pkgdir}/usr/bin/vendir"
[[ -f "${srcdir}/ytt-v0.44.3" ]] && install -Dm 755 "${srcdir}/ytt-v0.44.3" "${pkgdir}/usr/bin/ytt"
}

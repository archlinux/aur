# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=carvel-tools
pkgdesc="Set of Carvel tools: imgpkg kapp kbld kctrl kwt vendir ytt"
pkgver=20230131
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
kapp-v0.54.2::https://github.com/carvel-dev/kapp/releases/download/v0.54.2/kapp-linux-amd64
kbld-v0.36.3::https://github.com/carvel-dev/kbld/releases/download/v0.36.3/kbld-linux-amd64
kctrl-v0.44.3::https://github.com/carvel-dev/kapp-controller/releases/download/v0.44.3/kctrl-linux-amd64
kwt-v0.0.6::https://github.com/carvel-dev/kwt/releases/download/v0.0.6/kwt-linux-amd64
vendir-v0.32.5::https://github.com/carvel-dev/vendir/releases/download/v0.32.5/vendir-linux-amd64
ytt-v0.44.3::https://github.com/carvel-dev/ytt/releases/download/v0.44.3/ytt-linux-amd64
)
sha256sums_x86_64=(
2c289cf6b5c88a4dd4bec17c9e57e49c2c7531c127ea130737945392cdc65362
bb586f4ee94a8fdeea5b3fcb934b95b20bb0d502deab19e9a445a573b6a27071
1d799fe491c87c18fa3b25473ee04acceea04d410cc8f806e8a6b06fa82abaee
33484f7848ab2aaedfb7023d41772dcceced3f8ed5da25bc3724de8b14972abd
92a1f18be6a8dca15b7537f4cc666713b556630c20c9246b335931a9379196a0
0d8a45d2d85647ce932e1d630d49668e96552140ad33c6adad5f589bb800bb8a
c047bd7084beea2b4a585b13148d7c1084ee6c4aee8a68592fc8ed7d75ecebc5
)
source_aarch64=(
imgpkg-v0.35.0::https://github.com/carvel-dev/imgpkg/releases/download/v0.35.0/imgpkg-linux-arm64
kapp-v0.54.2::https://github.com/carvel-dev/kapp/releases/download/v0.54.2/kapp-linux-arm64
kbld-v0.36.3::https://github.com/carvel-dev/kbld/releases/download/v0.36.3/kbld-linux-arm64
kctrl-v0.44.3::https://github.com/carvel-dev/kapp-controller/releases/download/v0.44.3/kctrl-linux-arm64
vendir-v0.32.5::https://github.com/carvel-dev/vendir/releases/download/v0.32.5/vendir-linux-arm64
ytt-v0.44.3::https://github.com/carvel-dev/ytt/releases/download/v0.44.3/ytt-linux-arm64
)
sha256sums_aarch64=(
eb972061a7a71b03ee224b3e3d7aa0ec9a45ec20a6c8c5b11917b223c58a9570
0e81eeb34bda28108f58011184c04226c422a83fc8a2d575dd5b85d4f569977a
c54c5a78fde0e2db92da8afaa3d2d5b7407d291106a8b8b32af6cbde1a5b3ebc
3ffd1f4bf8990287d22a69079dcc7041a2bc39bf637666390ee67bc89c218849
f05b9f453702f6f50cad66aecef4156b10f48c3b595cbad82c5940c155ec57a4
91d9ce5f2c9f8d11a127b1676d3a9fcb1982ec9b89084751c8bd335acffdb0c4
)
package() {
[[ -f "${srcdir}/imgpkg-v0.35.0" ]] && install -Dm 755 "${srcdir}/imgpkg-v0.35.0" "${pkgdir}/usr/bin/imgpkg"
[[ -f "${srcdir}/kapp-v0.54.2" ]] && install -Dm 755 "${srcdir}/kapp-v0.54.2" "${pkgdir}/usr/bin/kapp"
[[ -f "${srcdir}/kbld-v0.36.3" ]] && install -Dm 755 "${srcdir}/kbld-v0.36.3" "${pkgdir}/usr/bin/kbld"
[[ -f "${srcdir}/kctrl-v0.44.3" ]] && install -Dm 755 "${srcdir}/kctrl-v0.44.3" "${pkgdir}/usr/bin/kctrl"
[[ -f "${srcdir}/kwt-v0.0.6" ]] && install -Dm 755 "${srcdir}/kwt-v0.0.6" "${pkgdir}/usr/bin/kwt"
[[ -f "${srcdir}/vendir-v0.32.5" ]] && install -Dm 755 "${srcdir}/vendir-v0.32.5" "${pkgdir}/usr/bin/vendir"
[[ -f "${srcdir}/ytt-v0.44.3" ]] && install -Dm 755 "${srcdir}/ytt-v0.44.3" "${pkgdir}/usr/bin/ytt"
}

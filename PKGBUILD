# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=carvel-tools
pkgdesc="Set of Carvel tools: imgpkg kapp kbld kctrl kwt vendir ytt"
pkgver=20230515
pkgrel=1
url="https://carvel.dev"
arch=(x86_64 aarch64)
license=(Apache)
provides_x86_64=(imgpkg kapp kbld kctrl kwt vendir ytt)
provides_aarch64=(imgpkg kapp kbld kctrl vendir ytt)
conflicts_x86_64=(imgpkg kapp kbld kctrl kwt vendir ytt)
conflicts_aarch64=(imgpkg kapp kbld kctrl vendir ytt)

source_x86_64=(
imgpkg-v0.36.2::https://github.com/carvel-dev/imgpkg/releases/download/v0.36.2/imgpkg-linux-amd64
kapp-v0.55.1::https://github.com/carvel-dev/kapp/releases/download/v0.55.1/kapp-linux-amd64
kbld-v0.37.1::https://github.com/carvel-dev/kbld/releases/download/v0.37.1/kbld-linux-amd64
kctrl-v0.45.1::https://github.com/carvel-dev/kapp-controller/releases/download/v0.45.1/kctrl-linux-amd64
kwt-v0.0.6::https://github.com/carvel-dev/kwt/releases/download/v0.0.6/kwt-linux-amd64
vendir-v0.33.2::https://github.com/carvel-dev/vendir/releases/download/v0.33.2/vendir-linux-amd64
ytt-v0.45.1::https://github.com/carvel-dev/ytt/releases/download/v0.45.1/ytt-linux-amd64
)
sha256sums_x86_64=(
56969766bfb23797ac9825e1b5782215fee0b4c6f28a7b8196babe4d3ec5c365
7a6f311a464d6e6331cc5ea93e1b6201875e259b2d1ed2b5a5b5798402c35fba
f32fb1251fcbb70d192542105044c5291c6e67fbca7fb467bf0d38d92b9bf204
865a2ffc10a32597cf026656382829e9b33bb42f55fad70338b4c59aa5de33e5
92a1f18be6a8dca15b7537f4cc666713b556630c20c9246b335931a9379196a0
2cc8f8db317685f7d270264712bb31efbfde14e95b065f31cd1e2d8c9eeb2d34
01606d885cdbce02340faadc29a83b5415280bc610e7cff3f639385d8f504aea
)
source_aarch64=(
imgpkg-v0.36.2::https://github.com/carvel-dev/imgpkg/releases/download/v0.36.2/imgpkg-linux-arm64
kapp-v0.55.1::https://github.com/carvel-dev/kapp/releases/download/v0.55.1/kapp-linux-arm64
kbld-v0.37.1::https://github.com/carvel-dev/kbld/releases/download/v0.37.1/kbld-linux-arm64
kctrl-v0.45.1::https://github.com/carvel-dev/kapp-controller/releases/download/v0.45.1/kctrl-linux-arm64
vendir-v0.33.2::https://github.com/carvel-dev/vendir/releases/download/v0.33.2/vendir-linux-arm64
ytt-v0.45.1::https://github.com/carvel-dev/ytt/releases/download/v0.45.1/ytt-linux-arm64
)
sha256sums_aarch64=(
c5546f339835a57cf5505b85e7f817610a37a291c453bff52212b736d83836e6
c017130cf75ba4e0d1a7ca8adff4dd4dcdff639ea241206b9d2c2dcefcffa764
fdc36ff10798d86b42c8e52314e4721bd032ea46530e7511d77ed6fca72c1d99
340756165a88e4d2e242d812259362026b418982f0484412900c3346b292b7de
8ed6efef4233ad226c3301f381d4341a096518b7b445fc7e418ed10ed7434159
e5112e7c69c4e664d245a5482fad95f07b49b04c77c7b2c86f1eab86d294817a
)
package() {
[[ -f "${srcdir}/imgpkg-v0.36.2" ]] && install -Dm 755 "${srcdir}/imgpkg-v0.36.2" "${pkgdir}/usr/bin/imgpkg"
[[ -f "${srcdir}/kapp-v0.55.1" ]] && install -Dm 755 "${srcdir}/kapp-v0.55.1" "${pkgdir}/usr/bin/kapp"
[[ -f "${srcdir}/kbld-v0.37.1" ]] && install -Dm 755 "${srcdir}/kbld-v0.37.1" "${pkgdir}/usr/bin/kbld"
[[ -f "${srcdir}/kctrl-v0.45.1" ]] && install -Dm 755 "${srcdir}/kctrl-v0.45.1" "${pkgdir}/usr/bin/kctrl"
[[ -f "${srcdir}/kwt-v0.0.6" ]] && install -Dm 755 "${srcdir}/kwt-v0.0.6" "${pkgdir}/usr/bin/kwt"
[[ -f "${srcdir}/vendir-v0.33.2" ]] && install -Dm 755 "${srcdir}/vendir-v0.33.2" "${pkgdir}/usr/bin/vendir"
[[ -f "${srcdir}/ytt-v0.45.1" ]] && install -Dm 755 "${srcdir}/ytt-v0.45.1" "${pkgdir}/usr/bin/ytt"
}

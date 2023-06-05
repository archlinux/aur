# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=carvel-tools
pkgdesc="Set of Carvel tools: imgpkg kapp kbld kctrl kwt vendir ytt"
pkgver=20230605
pkgrel=1
url="https://carvel.dev"
arch=(x86_64 aarch64)
license=(Apache)
provides_x86_64=(imgpkg kapp kbld kctrl kwt vendir ytt)
provides_aarch64=(imgpkg kapp kbld kctrl vendir ytt)
conflicts_x86_64=(imgpkg kapp kbld kctrl kwt vendir ytt)
conflicts_aarch64=(imgpkg kapp kbld kctrl vendir ytt)

source_x86_64=(
imgpkg-v0.37.1::https://github.com/carvel-dev/imgpkg/releases/download/v0.37.1/imgpkg-linux-amd64
kapp-v0.56.0::https://github.com/carvel-dev/kapp/releases/download/v0.56.0/kapp-linux-amd64
kbld-v0.37.2::https://github.com/carvel-dev/kbld/releases/download/v0.37.2/kbld-linux-amd64
kctrl-v0.45.1::https://github.com/carvel-dev/kapp-controller/releases/download/v0.45.1/kctrl-linux-amd64
kwt-v0.0.6::https://github.com/carvel-dev/kwt/releases/download/v0.0.6/kwt-linux-amd64
vendir-v0.34.0::https://github.com/carvel-dev/vendir/releases/download/v0.34.0/vendir-linux-amd64
ytt-v0.45.2::https://github.com/carvel-dev/ytt/releases/download/v0.45.2/ytt-linux-amd64
)
sha256sums_x86_64=(
84d1cd7be13566fe64789c031112831b37fe8625b08b1d2e1be2407c0998ba91
2764aac38435b1178a9c232c072b6e184bfc8802268580ab911a1e84eebc42c1
e212d112da6475d0a3176c9c106de0cf3414e2d3d0662ba6642c652f17a9389d
865a2ffc10a32597cf026656382829e9b33bb42f55fad70338b4c59aa5de33e5
92a1f18be6a8dca15b7537f4cc666713b556630c20c9246b335931a9379196a0
870cadae90f3b1637c47b864522c8cb8bb39d0c06ab7cfd7bf3bef8869ba484e
c909d88845ce55430a91a1cf9db5e3f14ffa8ce53d6ecb42e7ff3acf56a2037f
)
source_aarch64=(
imgpkg-v0.37.1::https://github.com/carvel-dev/imgpkg/releases/download/v0.37.1/imgpkg-linux-arm64
kapp-v0.56.0::https://github.com/carvel-dev/kapp/releases/download/v0.56.0/kapp-linux-arm64
kbld-v0.37.2::https://github.com/carvel-dev/kbld/releases/download/v0.37.2/kbld-linux-arm64
kctrl-v0.45.1::https://github.com/carvel-dev/kapp-controller/releases/download/v0.45.1/kctrl-linux-arm64
vendir-v0.34.0::https://github.com/carvel-dev/vendir/releases/download/v0.34.0/vendir-linux-arm64
ytt-v0.45.2::https://github.com/carvel-dev/ytt/releases/download/v0.45.2/ytt-linux-arm64
)
sha256sums_aarch64=(
8d41033b680c41fe17ab0ff80b88e9c40af68a8e7c48a7a2e71f30e8a8534230
7ce8bb078204530f0e15a761c17b30cc49d55188de73ea78c89888509663ed39
42b51deb1853f4a4d153b90558a917ee8ee0f9126ba87edbf96bb55041e91f3f
340756165a88e4d2e242d812259362026b418982f0484412900c3346b292b7de
835ef62c15ee2c2f6487dfca4aca29cd314ea7dcf38fe53b3da28891c4bc065f
11c357a59cee76dc06a0ad8e4ad081fd0fe0b9923ca7458967692de98cca43c7
)
package() {
[[ -f "${srcdir}/imgpkg-v0.37.1" ]] && install -Dm 755 "${srcdir}/imgpkg-v0.37.1" "${pkgdir}/usr/bin/imgpkg"
[[ -f "${srcdir}/kapp-v0.56.0" ]] && install -Dm 755 "${srcdir}/kapp-v0.56.0" "${pkgdir}/usr/bin/kapp"
[[ -f "${srcdir}/kbld-v0.37.2" ]] && install -Dm 755 "${srcdir}/kbld-v0.37.2" "${pkgdir}/usr/bin/kbld"
[[ -f "${srcdir}/kctrl-v0.45.1" ]] && install -Dm 755 "${srcdir}/kctrl-v0.45.1" "${pkgdir}/usr/bin/kctrl"
[[ -f "${srcdir}/kwt-v0.0.6" ]] && install -Dm 755 "${srcdir}/kwt-v0.0.6" "${pkgdir}/usr/bin/kwt"
[[ -f "${srcdir}/vendir-v0.34.0" ]] && install -Dm 755 "${srcdir}/vendir-v0.34.0" "${pkgdir}/usr/bin/vendir"
[[ -f "${srcdir}/ytt-v0.45.2" ]] && install -Dm 755 "${srcdir}/ytt-v0.45.2" "${pkgdir}/usr/bin/ytt"
}

# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=carvel-tools
pkgdesc="Set of Carvel tools (binaries): imgpkg kapp kbld kctrl kwt vendir ytt"
pkgver=20231013
pkgrel=1
url="https://carvel.dev"
arch=(x86_64 aarch64)
license=(Apache)
provides=(imgpkg kapp kbld kctrl kwt vendir ytt)
conflicts=(imgpkg kapp kbld kctrl kwt vendir ytt)

source_x86_64=(
imgpkg-v0.38.0::https://github.com/carvel-dev/imgpkg/releases/download/v0.38.0/imgpkg-linux-amd64
kapp-v0.59.0::https://github.com/carvel-dev/kapp/releases/download/v0.59.0/kapp-linux-amd64
kbld-v0.38.0::https://github.com/carvel-dev/kbld/releases/download/v0.38.0/kbld-linux-amd64
kctrl-v0.48.1::https://github.com/carvel-dev/kapp-controller/releases/download/v0.48.1/kctrl-linux-amd64
kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-amd64
vendir-v0.35.0::https://github.com/carvel-dev/vendir/releases/download/v0.35.0/vendir-linux-amd64
ytt-v0.46.0::https://github.com/carvel-dev/ytt/releases/download/v0.46.0/ytt-linux-amd64
)
sha256sums_x86_64=(
3f272fc7eacb129a989b8f686ea59455ab7e65423192803c15d6affb963f86a9
cc1cca783173badd5e74edc1f10decfcae85525cfece73b3d43acfda1eaccbe5
c6ecf2d36b7a72f2bab57fae2a6e8a2a886c2b0072388a9f7dd07363fc0f13fc
c6d322ed950ddc6112c1d1dba1feeabc24f222e4a24decba2d60c02403194406
1022483a8b59fe238e782a9138f1fee6ca61ecf7ccd1e5f0d98e95c56df94d87
d9109fb8f07bedab820b60e4789a2b183857073fa392cd603b9cabeac795ba04
348cb34965b64c07fd5118e69efd9a4fae7e22f57db4e91e2d9903c1ad19f041
)
source_aarch64=(
imgpkg-v0.38.0::https://github.com/carvel-dev/imgpkg/releases/download/v0.38.0/imgpkg-linux-arm64
kapp-v0.59.0::https://github.com/carvel-dev/kapp/releases/download/v0.59.0/kapp-linux-arm64
kbld-v0.38.0::https://github.com/carvel-dev/kbld/releases/download/v0.38.0/kbld-linux-arm64
kctrl-v0.48.1::https://github.com/carvel-dev/kapp-controller/releases/download/v0.48.1/kctrl-linux-arm64
kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-arm64
vendir-v0.35.0::https://github.com/carvel-dev/vendir/releases/download/v0.35.0/vendir-linux-arm64
ytt-v0.46.0::https://github.com/carvel-dev/ytt/releases/download/v0.46.0/ytt-linux-arm64
)
sha256sums_aarch64=(
975f013ac48007314a34aa2d575c09fb186db0918f446a5ef0905ec2730453ef
59a8ddcacf82cec055f0ca9e66b1ea90ade138792db1b1ddaa72d653cc6d93ba
9d6d2897b83a60dd9538c8f589e177ba0594747bb3717127dc4671a876a8a363
822e9c70d0f810c65324bc78fc3469e9f850a8a9c75a9876a272bc9c8266db70
7b94a134cbde5ff2e245d102f54b9ac9f81b3fcc5e54a5cefecc1e5845b8a65f
a2810fef1123ee6eda307229f50b2e549b3ef14efb1ecdb2771405fdb0573f0c
9552c863452622386b9e9fcab0eb0533b6e8c77bc3f5c753967d40232b2a1721
)
package() {
install -Dm 755 "${srcdir}/imgpkg-v0.38.0" "${pkgdir}/usr/bin/imgpkg"
install -Dm 755 "${srcdir}/kapp-v0.59.0" "${pkgdir}/usr/bin/kapp"
install -Dm 755 "${srcdir}/kbld-v0.38.0" "${pkgdir}/usr/bin/kbld"
install -Dm 755 "${srcdir}/kctrl-v0.48.1" "${pkgdir}/usr/bin/kctrl"
install -Dm 755 "${srcdir}/kwt-v0.0.8" "${pkgdir}/usr/bin/kwt"
install -Dm 755 "${srcdir}/vendir-v0.35.0" "${pkgdir}/usr/bin/vendir"
install -Dm 755 "${srcdir}/ytt-v0.46.0" "${pkgdir}/usr/bin/ytt"
}

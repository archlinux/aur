# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=carvel-tools
pkgdesc="Set of Carvel tools: imgpkg kapp kbld kctrl kwt vendir ytt"
pkgver=20230103
pkgrel=1
url="https://carvel.dev"
arch=(x86_64 aarch64)
license=(Apache)
provides_x86_64=(imgpkg kapp kbld kctrl kwt vendir ytt)
provides_aarch64=(imgpkg kapp kbld kctrl vendir ytt)
conflicts_x86_64=(imgpkg kapp kbld kctrl kwt vendir ytt)
conflicts_aarch64=(imgpkg kapp kbld kctrl vendir ytt)

source_x86_64=(
imgpkg-v0.34.1::https://github.com/vmware-tanzu/carvel-imgpkg/releases/download/v0.34.1/imgpkg-linux-amd64
kapp-v0.54.1::https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.54.1/kapp-linux-amd64
kbld-v0.36.1::https://github.com/vmware-tanzu/carvel-kbld/releases/download/v0.36.1/kbld-linux-amd64
kctrl-v0.44.1::https://github.com/vmware-tanzu/carvel-kapp-controller/releases/download/v0.44.1/kctrl-linux-amd64
kwt-v0.0.6::https://github.com/vmware-tanzu/carvel-kwt/releases/download/v0.0.6/kwt-linux-amd64
vendir-v0.32.2::https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.32.2/vendir-linux-amd64
ytt-v0.44.1::https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.44.1/ytt-linux-amd64
)
sha256sums_x86_64=(
de864d7c77cf1338f28c02828de7bfd3a34c0670692cb415ab0c34352c6e605b
436e30a34647b2d889010d08a9242b4d3954f4c84c9ca26dd30751934ecf9950
fa954cf4e288d61e671a2be93d41d08309951d705b1f02d4c90213aa5736add5
7b333bdffc69b21c85b0d7695d6932a2e1da96684546259aa77e272bfab1cbab
92a1f18be6a8dca15b7537f4cc666713b556630c20c9246b335931a9379196a0
f5d3cbbd8135d2d48f4f007b8a933bd60b2a827d68f4001c5d1774392fa7b3f2
9f2f151cf42a54cdfee5ee1a98b7255821c9c047498d4af788cec8c4cf520fb8
)
source_aarch64=(
imgpkg-v0.34.1::https://github.com/vmware-tanzu/carvel-imgpkg/releases/download/v0.34.1/imgpkg-linux-arm64
kapp-v0.54.1::https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.54.1/kapp-linux-arm64
kbld-v0.36.1::https://github.com/vmware-tanzu/carvel-kbld/releases/download/v0.36.1/kbld-linux-arm64
kctrl-v0.44.1::https://github.com/vmware-tanzu/carvel-kapp-controller/releases/download/v0.44.1/kctrl-linux-arm64
vendir-v0.32.2::https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.32.2/vendir-linux-arm64
ytt-v0.44.1::https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.44.1/ytt-linux-arm64
)
sha256sums_aarch64=(
45b0932cbfc2fab1d6687b2ada72360b708cdeaa769fb2e85bac83db7fe8203b
197971e92b44a54ddeb28aa3549310382c1a109e408a485b6eb41d9d0b73dba3
b457413588f5911fd3dc04f1143fd683e322228090cb3024c0d58463ce6f0a4e
d1705d862f1af0ecf54facc2e39300e8f979eb276d8902b42170a76266b04512
eee5abf139043c459ff2b9ffab0a75556d4930d44abc5e7e4477e84b598b6f82
2b29dfb97be4a7333ab1e911887c884b2d1de16ee75f16b697fdbfe9661f58be
)
package() {
[[ -f "${srcdir}/imgpkg-v0.34.1" ]] && install -Dm 755 "${srcdir}/imgpkg-v0.34.1" "${pkgdir}/usr/bin/imgpkg"
[[ -f "${srcdir}/kapp-v0.54.1" ]] && install -Dm 755 "${srcdir}/kapp-v0.54.1" "${pkgdir}/usr/bin/kapp"
[[ -f "${srcdir}/kbld-v0.36.1" ]] && install -Dm 755 "${srcdir}/kbld-v0.36.1" "${pkgdir}/usr/bin/kbld"
[[ -f "${srcdir}/kctrl-v0.44.1" ]] && install -Dm 755 "${srcdir}/kctrl-v0.44.1" "${pkgdir}/usr/bin/kctrl"
[[ -f "${srcdir}/kwt-v0.0.6" ]] && install -Dm 755 "${srcdir}/kwt-v0.0.6" "${pkgdir}/usr/bin/kwt"
[[ -f "${srcdir}/vendir-v0.32.2" ]] && install -Dm 755 "${srcdir}/vendir-v0.32.2" "${pkgdir}/usr/bin/vendir"
[[ -f "${srcdir}/ytt-v0.44.1" ]] && install -Dm 755 "${srcdir}/ytt-v0.44.1" "${pkgdir}/usr/bin/ytt"
}

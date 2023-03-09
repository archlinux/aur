# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=carvel-tools
pkgdesc="Set of Carvel tools: imgpkg kapp kbld kctrl kwt vendir ytt"
pkgver=20230309
pkgrel=1
url="https://carvel.dev"
arch=(x86_64 aarch64)
license=(Apache)
provides_x86_64=(imgpkg kapp kbld kctrl kwt vendir ytt)
provides_aarch64=(imgpkg kapp kbld kctrl vendir ytt)
conflicts_x86_64=(imgpkg kapp kbld kctrl kwt vendir ytt)
conflicts_aarch64=(imgpkg kapp kbld kctrl vendir ytt)

source_x86_64=(
imgpkg-v0.36.0::https://github.com/carvel-dev/imgpkg/releases/download/v0.36.0/imgpkg-linux-amd64
kapp-v0.55.0::https://github.com/carvel-dev/kapp/releases/download/v0.55.0/kapp-linux-amd64
kbld-v0.37.0::https://github.com/carvel-dev/kbld/releases/download/v0.37.0/kbld-linux-amd64
kctrl-v0.44.6::https://github.com/carvel-dev/kapp-controller/releases/download/v0.44.6/kctrl-linux-amd64
kwt-v0.0.6::https://github.com/carvel-dev/kwt/releases/download/v0.0.6/kwt-linux-amd64
vendir-v0.33.1::https://github.com/carvel-dev/vendir/releases/download/v0.33.1/vendir-linux-amd64
ytt-v0.45.0::https://github.com/carvel-dev/ytt/releases/download/v0.45.0/ytt-linux-amd64
)
sha256sums_x86_64=(
db5b3f7d8f87790b6df3a4c0fda4ad58e74b8ccf1a3cd6c3c113bf142597190c
9aaa735985efbe240af0ca1d80adf3b43be6cf4ec6620a053082e31bea25dae7
9f387e18043c95c922efbf879fc1d4d616b20c1c47aeae4f834c6f0069906735
053962a5e40210059256db2625bdc1e15e3d4617cee1c9d28dd7dfcc034b9a32
92a1f18be6a8dca15b7537f4cc666713b556630c20c9246b335931a9379196a0
6c9ed811fe9983e03424f2ecfc00a4aaeb19646ef27c42eb2a6c643ea07bd32b
d05f430ac18b3791d831f4cfd78371a7549f225dfaeb6fef2e5bfcd293d6c382
)
source_aarch64=(
imgpkg-v0.36.0::https://github.com/carvel-dev/imgpkg/releases/download/v0.36.0/imgpkg-linux-arm64
kapp-v0.55.0::https://github.com/carvel-dev/kapp/releases/download/v0.55.0/kapp-linux-arm64
kbld-v0.37.0::https://github.com/carvel-dev/kbld/releases/download/v0.37.0/kbld-linux-arm64
kctrl-v0.44.6::https://github.com/carvel-dev/kapp-controller/releases/download/v0.44.6/kctrl-linux-arm64
vendir-v0.33.1::https://github.com/carvel-dev/vendir/releases/download/v0.33.1/vendir-linux-arm64
ytt-v0.45.0::https://github.com/carvel-dev/ytt/releases/download/v0.45.0/ytt-linux-arm64
)
sha256sums_aarch64=(
1011b7508d0ba447069fec827a2ace7cdac1be4d21475c5891db0be04aeeb1f3
944fdfebfdf1026d318609cc706bad454196f0b1d76e557b56c829b0e6165a9f
0ffa023c69355ca43ae131be065963e30d576963a066e903c7691fb54a79d08c
20b0b9ad0ca77341327b66754b8ee6b62ded01aff48f3408ad4c60065b8ef37a
79e026faaa1ac75c36414a97ee7e58b4bf9c148b1ce34aee795c667b71745519
54e228823e851320b848d854218004299d2ff362e0fe9e287d5a52df502baaaf
)
package() {
[[ -f "${srcdir}/imgpkg-v0.36.0" ]] && install -Dm 755 "${srcdir}/imgpkg-v0.36.0" "${pkgdir}/usr/bin/imgpkg"
[[ -f "${srcdir}/kapp-v0.55.0" ]] && install -Dm 755 "${srcdir}/kapp-v0.55.0" "${pkgdir}/usr/bin/kapp"
[[ -f "${srcdir}/kbld-v0.37.0" ]] && install -Dm 755 "${srcdir}/kbld-v0.37.0" "${pkgdir}/usr/bin/kbld"
[[ -f "${srcdir}/kctrl-v0.44.6" ]] && install -Dm 755 "${srcdir}/kctrl-v0.44.6" "${pkgdir}/usr/bin/kctrl"
[[ -f "${srcdir}/kwt-v0.0.6" ]] && install -Dm 755 "${srcdir}/kwt-v0.0.6" "${pkgdir}/usr/bin/kwt"
[[ -f "${srcdir}/vendir-v0.33.1" ]] && install -Dm 755 "${srcdir}/vendir-v0.33.1" "${pkgdir}/usr/bin/vendir"
[[ -f "${srcdir}/ytt-v0.45.0" ]] && install -Dm 755 "${srcdir}/ytt-v0.45.0" "${pkgdir}/usr/bin/ytt"
}

# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=carvel-tools
pkgdesc="Set of Carvel tools: imgpkg kapp kbld kctrl kwt vendir ytt"
pkgver=20230819
pkgrel=1
url="https://carvel.dev"
arch=(x86_64 aarch64)
license=(Apache)
provides_x86_64=(imgpkg kapp kbld kctrl kwt vendir ytt)
provides_aarch64=(imgpkg kapp kbld kctrl vendir ytt)
conflicts_x86_64=(imgpkg kapp kbld kctrl kwt vendir ytt)
conflicts_aarch64=(imgpkg kapp kbld kctrl vendir ytt)

source_x86_64=(
imgpkg-v0.37.3::https://github.com/carvel-dev/imgpkg/releases/download/v0.37.3/imgpkg-linux-amd64
kapp-v0.58.0::https://github.com/carvel-dev/kapp/releases/download/v0.58.0/kapp-linux-amd64
kbld-v0.37.5::https://github.com/carvel-dev/kbld/releases/download/v0.37.5/kbld-linux-amd64
kctrl-v0.46.2::https://github.com/carvel-dev/kapp-controller/releases/download/v0.46.2/kctrl-linux-amd64
kwt-v0.0.6::https://github.com/carvel-dev/kwt/releases/download/v0.0.6/kwt-linux-amd64
vendir-v0.34.4::https://github.com/carvel-dev/vendir/releases/download/v0.34.4/vendir-linux-amd64
ytt-v0.45.4::https://github.com/carvel-dev/ytt/releases/download/v0.45.4/ytt-linux-amd64
)
sha256sums_x86_64=(
1248f35565a67dd4505d42b324c527f2690d9986d2932fe717a4ffdb9271f9ff
b253ea9cf6add07f9497955147dc12e8612c24c36dc9929c9a4fecdc76752bd3
90f9ef52e6e15e76f4b077f918d8ef26f3b6514229011fc35a83c890cd59dc38
f17d2d016d16cb834ef961f1b06ad76298eacc7262eea552226e686021a801cd
92a1f18be6a8dca15b7537f4cc666713b556630c20c9246b335931a9379196a0
7b398b817983cfdfbdee58432784743d336f367b532d3bae1f28ca641e62f357
9bf62175c7cc0b54f9731a5b87ee40250f0457b1fce1b0b36019c2f8d96db8f8
)
source_aarch64=(
imgpkg-v0.37.3::https://github.com/carvel-dev/imgpkg/releases/download/v0.37.3/imgpkg-linux-arm64
kapp-v0.58.0::https://github.com/carvel-dev/kapp/releases/download/v0.58.0/kapp-linux-arm64
kbld-v0.37.5::https://github.com/carvel-dev/kbld/releases/download/v0.37.5/kbld-linux-arm64
kctrl-v0.46.2::https://github.com/carvel-dev/kapp-controller/releases/download/v0.46.2/kctrl-linux-arm64
vendir-v0.34.4::https://github.com/carvel-dev/vendir/releases/download/v0.34.4/vendir-linux-arm64
ytt-v0.45.4::https://github.com/carvel-dev/ytt/releases/download/v0.45.4/ytt-linux-arm64
)
sha256sums_aarch64=(
951ca7156596b18dfdeada589df7356bbfbdecc57cd0d67fa34d73d2aa233b9d
25491298f6783a8b337d2ebdecf749f7750cf10260fe37086315a9c7da0b558f
1d5a4f8782e98d9be71365032a1be488e09ebd6334cf46a4efafff277180d44f
168e512214d841107caea00650fe32b48cfc5e3318f7b5eabe2fa0d3cef4f0a4
fb9deed2eb57cfcc9dcb4167a4d3abda0bb4d754a964c69309f099a2203c555d
cbfc85f11ffd8e61d63accf799b8997caaebe46ee046290cc1c4d05ed1ab145b
)
package() {
[[ -f "${srcdir}/imgpkg-v0.37.3" ]] && install -Dm 755 "${srcdir}/imgpkg-v0.37.3" "${pkgdir}/usr/bin/imgpkg"
[[ -f "${srcdir}/kapp-v0.58.0" ]] && install -Dm 755 "${srcdir}/kapp-v0.58.0" "${pkgdir}/usr/bin/kapp"
[[ -f "${srcdir}/kbld-v0.37.5" ]] && install -Dm 755 "${srcdir}/kbld-v0.37.5" "${pkgdir}/usr/bin/kbld"
[[ -f "${srcdir}/kctrl-v0.46.2" ]] && install -Dm 755 "${srcdir}/kctrl-v0.46.2" "${pkgdir}/usr/bin/kctrl"
[[ -f "${srcdir}/kwt-v0.0.6" ]] && install -Dm 755 "${srcdir}/kwt-v0.0.6" "${pkgdir}/usr/bin/kwt"
[[ -f "${srcdir}/vendir-v0.34.4" ]] && install -Dm 755 "${srcdir}/vendir-v0.34.4" "${pkgdir}/usr/bin/vendir"
[[ -f "${srcdir}/ytt-v0.45.4" ]] && install -Dm 755 "${srcdir}/ytt-v0.45.4" "${pkgdir}/usr/bin/ytt"
}

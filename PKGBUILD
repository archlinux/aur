# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=carvel-tools
pkgdesc="Set of Carvel tools: imgpkg kapp kbld kctrl kwt vendir ytt"
pkgver=20230810
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
kbld-v0.37.4::https://github.com/carvel-dev/kbld/releases/download/v0.37.4/kbld-linux-amd64
kctrl-v0.46.1::https://github.com/carvel-dev/kapp-controller/releases/download/v0.46.1/kctrl-linux-amd64
kwt-v0.0.6::https://github.com/carvel-dev/kwt/releases/download/v0.0.6/kwt-linux-amd64
vendir-v0.34.3::https://github.com/carvel-dev/vendir/releases/download/v0.34.3/vendir-linux-amd64
ytt-v0.45.3::https://github.com/carvel-dev/ytt/releases/download/v0.45.3/ytt-linux-amd64
)
sha256sums_x86_64=(
1248f35565a67dd4505d42b324c527f2690d9986d2932fe717a4ffdb9271f9ff
b253ea9cf6add07f9497955147dc12e8612c24c36dc9929c9a4fecdc76752bd3
814dbd68282717481db7bd99e56cc3f6ff0664880daf880aa44c88ff10d9588b
f8db054db89e204d2b1cab165998ac1434a9f5fa8fc4ffeae52a4c17b1e52942
92a1f18be6a8dca15b7537f4cc666713b556630c20c9246b335931a9379196a0
26cdf2710cd4f5198c2b8beaab88f70db4075a82660963a01b271d75cd8e5779
a6729fb8514f10ab58f9ed3b50cd90ef79bf16d1cb29173baa84e1af0bc5ad4f
)
source_aarch64=(
imgpkg-v0.37.3::https://github.com/carvel-dev/imgpkg/releases/download/v0.37.3/imgpkg-linux-arm64
kapp-v0.58.0::https://github.com/carvel-dev/kapp/releases/download/v0.58.0/kapp-linux-arm64
kbld-v0.37.4::https://github.com/carvel-dev/kbld/releases/download/v0.37.4/kbld-linux-arm64
kctrl-v0.46.1::https://github.com/carvel-dev/kapp-controller/releases/download/v0.46.1/kctrl-linux-arm64
vendir-v0.34.3::https://github.com/carvel-dev/vendir/releases/download/v0.34.3/vendir-linux-arm64
ytt-v0.45.3::https://github.com/carvel-dev/ytt/releases/download/v0.45.3/ytt-linux-arm64
)
sha256sums_aarch64=(
951ca7156596b18dfdeada589df7356bbfbdecc57cd0d67fa34d73d2aa233b9d
25491298f6783a8b337d2ebdecf749f7750cf10260fe37086315a9c7da0b558f
9867106fb543f10135c29986bea8256ed2d6a76b00faff02453a9c932c84e589
d542d3e76406de0558880c1631280ef7d31d05770e36ed8f944556021d5be1c5
b33b9c6172acbce88baf17ec38c16e9cd8d99ad1f3470d999e444071702bd06d
b0068b729e6787d0e6093ceb5678f5882d1ea2d56d75895e91f2082f64e588c5
)
package() {
[[ -f "${srcdir}/imgpkg-v0.37.3" ]] && install -Dm 755 "${srcdir}/imgpkg-v0.37.3" "${pkgdir}/usr/bin/imgpkg"
[[ -f "${srcdir}/kapp-v0.58.0" ]] && install -Dm 755 "${srcdir}/kapp-v0.58.0" "${pkgdir}/usr/bin/kapp"
[[ -f "${srcdir}/kbld-v0.37.4" ]] && install -Dm 755 "${srcdir}/kbld-v0.37.4" "${pkgdir}/usr/bin/kbld"
[[ -f "${srcdir}/kctrl-v0.46.1" ]] && install -Dm 755 "${srcdir}/kctrl-v0.46.1" "${pkgdir}/usr/bin/kctrl"
[[ -f "${srcdir}/kwt-v0.0.6" ]] && install -Dm 755 "${srcdir}/kwt-v0.0.6" "${pkgdir}/usr/bin/kwt"
[[ -f "${srcdir}/vendir-v0.34.3" ]] && install -Dm 755 "${srcdir}/vendir-v0.34.3" "${pkgdir}/usr/bin/vendir"
[[ -f "${srcdir}/ytt-v0.45.3" ]] && install -Dm 755 "${srcdir}/ytt-v0.45.3" "${pkgdir}/usr/bin/ytt"
}

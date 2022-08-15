# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=carvel-tools
pkgdesc="Set of Carvel tools: imgpkg kapp kbld kctrl kwt vendir ytt"
pkgver=20220815
pkgrel=1
url="https://carvel.dev"
arch=(x86_64 aarch64)
license=(Apache)
provides_x86_64=(imgpkg kapp kbld kctrl kwt vendir ytt)
provides_aarch64=(imgpkg kapp kbld kctrl vendir ytt)
conflicts_x86_64=(imgpkg kapp kbld kctrl kwt vendir ytt)
conflicts_aarch64=(imgpkg kapp kbld kctrl vendir ytt)

source_x86_64=(
imgpkg-v0.30.0::https://github.com/vmware-tanzu/carvel-imgpkg/releases/download/v0.30.0/imgpkg-linux-amd64
kapp-v0.52.0::https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.52.0/kapp-linux-amd64
kbld-v0.34.0::https://github.com/vmware-tanzu/carvel-kbld/releases/download/v0.34.0/kbld-linux-amd64
kctrl-v0.39.0::https://github.com/vmware-tanzu/carvel-kapp-controller/releases/download/v0.39.0/kctrl-linux-amd64
kwt-v0.0.6::https://github.com/vmware-tanzu/carvel-kwt/releases/download/v0.0.6/kwt-linux-amd64
vendir-v0.30.0::https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.30.0/vendir-linux-amd64
ytt-v0.42.0::https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.42.0/ytt-linux-amd64
)
sha256sums_x86_64=(
0b067b406775ce3b3b4ac668a6d1b89184b8339480f07a48de74a338b334e7b4
9c6ab08ddb4f950eeed9df4b8618d43d3cf82f076c24073885904b3c14ba5bd7
67c86ece94a3747b2e011a5b72044b69f2594ca807621b1e1e4c805f6abcaeef
de1392ba4fc269eefde8018633dbcc0007c06dbe20eab924a9a419ae6d451fca
92a1f18be6a8dca15b7537f4cc666713b556630c20c9246b335931a9379196a0
eb66c8fd398925e2a2e68a2f65de3ca06207addd86cf207c07f7ad566dbe7b25
aa7074d08dc35e588ab0e014f53e98aec0cfed6c3babf8a953c4225007e49ae7
)
source_aarch64=(
imgpkg-v0.30.0::https://github.com/vmware-tanzu/carvel-imgpkg/releases/download/v0.30.0/imgpkg-linux-arm64
kapp-v0.52.0::https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.52.0/kapp-linux-arm64
kbld-v0.34.0::https://github.com/vmware-tanzu/carvel-kbld/releases/download/v0.34.0/kbld-linux-arm64
kctrl-v0.39.0::https://github.com/vmware-tanzu/carvel-kapp-controller/releases/download/v0.39.0/kctrl-linux-arm64
vendir-v0.30.0::https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.30.0/vendir-linux-arm64
ytt-v0.42.0::https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.42.0/ytt-linux-arm64
)
sha256sums_aarch64=(
b1613051cc1c2d432d8daca4e96fe67ce1fa2ac41eec6a49f60e8f6da3b56a95
7f5564ac3b670dd2ff51953372924c2880e59c8aea38acc21f433044ba18d707
658725c5dab5349dd4cb826ff9278749f093ed2275aadf51dc994265e6599b2c
a623b6243a850e5a0e2f89dca2b6c795afbab833c97143599df0edd037feef31
bbe6747135e0e4995a2378f1d556c0e0a20383391cf80dd4421748b028d3eb1c
f7cdcef8dc8e97f412a2d52b9d47da7cfa02612899d68c567a475d6985f56d9a
)
package() {
[[ -f "${srcdir}/imgpkg-v0.30.0" ]] && install -Dm 755 "${srcdir}/imgpkg-v0.30.0" "${pkgdir}/usr/bin/imgpkg"
[[ -f "${srcdir}/kapp-v0.52.0" ]] && install -Dm 755 "${srcdir}/kapp-v0.52.0" "${pkgdir}/usr/bin/kapp"
[[ -f "${srcdir}/kbld-v0.34.0" ]] && install -Dm 755 "${srcdir}/kbld-v0.34.0" "${pkgdir}/usr/bin/kbld"
[[ -f "${srcdir}/kctrl-v0.39.0" ]] && install -Dm 755 "${srcdir}/kctrl-v0.39.0" "${pkgdir}/usr/bin/kctrl"
[[ -f "${srcdir}/kwt-v0.0.6" ]] && install -Dm 755 "${srcdir}/kwt-v0.0.6" "${pkgdir}/usr/bin/kwt"
[[ -f "${srcdir}/vendir-v0.30.0" ]] && install -Dm 755 "${srcdir}/vendir-v0.30.0" "${pkgdir}/usr/bin/vendir"
[[ -f "${srcdir}/ytt-v0.42.0" ]] && install -Dm 755 "${srcdir}/ytt-v0.42.0" "${pkgdir}/usr/bin/ytt"
}

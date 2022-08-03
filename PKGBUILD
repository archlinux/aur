# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=carvel-tools
pkgdesc="Set of Carvel tools: imgpkg kapp kbld kctrl kwt vendir ytt"
pkgver=20220803
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
kapp-v0.51.0::https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.51.0/kapp-linux-amd64
kbld-v0.34.0::https://github.com/vmware-tanzu/carvel-kbld/releases/download/v0.34.0/kbld-linux-amd64
kctrl-v0.38.4::https://github.com/vmware-tanzu/carvel-kapp-controller/releases/download/v0.38.4/kctrl-linux-amd64
kwt-v0.0.6::https://github.com/vmware-tanzu/carvel-kwt/releases/download/v0.0.6/kwt-linux-amd64
vendir-v0.29.0::https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.29.0/vendir-linux-amd64
ytt-v0.42.0::https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.42.0/ytt-linux-amd64
)
sha256sums_x86_64=(
0b067b406775ce3b3b4ac668a6d1b89184b8339480f07a48de74a338b334e7b4
58443df4200c683597f5c8a43ea8f5b7110bbcb1fbd8ca3f2061e9eff1a10e0e
67c86ece94a3747b2e011a5b72044b69f2594ca807621b1e1e4c805f6abcaeef
ec28529f7a60b918e200091a8f28dbebc50fda22620b5ba2c3faae4ab8c56446
92a1f18be6a8dca15b7537f4cc666713b556630c20c9246b335931a9379196a0
83b1cd15c6e4f69dc8daed9e38a202f16be7c6130a41adfbf6a5233da6148cb4
aa7074d08dc35e588ab0e014f53e98aec0cfed6c3babf8a953c4225007e49ae7
)
source_aarch64=(
imgpkg-v0.30.0::https://github.com/vmware-tanzu/carvel-imgpkg/releases/download/v0.30.0/imgpkg-linux-arm64
kapp-v0.51.0::https://github.com/vmware-tanzu/carvel-kapp/releases/download/v0.51.0/kapp-linux-arm64
kbld-v0.34.0::https://github.com/vmware-tanzu/carvel-kbld/releases/download/v0.34.0/kbld-linux-arm64
kctrl-v0.38.4::https://github.com/vmware-tanzu/carvel-kapp-controller/releases/download/v0.38.4/kctrl-linux-arm64
vendir-v0.29.0::https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.29.0/vendir-linux-arm64
ytt-v0.42.0::https://github.com/vmware-tanzu/carvel-ytt/releases/download/v0.42.0/ytt-linux-arm64
)
sha256sums_aarch64=(
b1613051cc1c2d432d8daca4e96fe67ce1fa2ac41eec6a49f60e8f6da3b56a95
368281fd8281bfc37d14704fd4482ec21cfabd63aeb66d07d520864057ceb599
658725c5dab5349dd4cb826ff9278749f093ed2275aadf51dc994265e6599b2c
8eb7202a331ace049515ebe187323d4366501ffbc153707fe54e7b45ebbf9291
2dca412abe68e583e447e75c557957e848b04ef80efebc9aacd19bb369368752
f7cdcef8dc8e97f412a2d52b9d47da7cfa02612899d68c567a475d6985f56d9a
)
package() {
[[ -f "${srcdir}/imgpkg-v0.30.0" ]] && install -Dm 755 "${srcdir}/imgpkg-v0.30.0" "${pkgdir}/usr/bin/imgpkg"
[[ -f "${srcdir}/kapp-v0.51.0" ]] && install -Dm 755 "${srcdir}/kapp-v0.51.0" "${pkgdir}/usr/bin/kapp"
[[ -f "${srcdir}/kbld-v0.34.0" ]] && install -Dm 755 "${srcdir}/kbld-v0.34.0" "${pkgdir}/usr/bin/kbld"
[[ -f "${srcdir}/kctrl-v0.38.4" ]] && install -Dm 755 "${srcdir}/kctrl-v0.38.4" "${pkgdir}/usr/bin/kctrl"
[[ -f "${srcdir}/kwt-v0.0.6" ]] && install -Dm 755 "${srcdir}/kwt-v0.0.6" "${pkgdir}/usr/bin/kwt"
[[ -f "${srcdir}/vendir-v0.29.0" ]] && install -Dm 755 "${srcdir}/vendir-v0.29.0" "${pkgdir}/usr/bin/vendir"
[[ -f "${srcdir}/ytt-v0.42.0" ]] && install -Dm 755 "${srcdir}/ytt-v0.42.0" "${pkgdir}/usr/bin/ytt"
}

# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=carvel-tools
pkgver=20231111
pkgrel=1
pkgdesc="Set of Carvel tools (binaries): imgpkg kapp kbld kctrl kwt vendir ytt"
url="https://carvel.dev"
arch=(x86_64 aarch64)
license=(Apache)
conflicts=(imgpkg kapp kbld kctrl kwt vendir ytt)
provides=(imgpkg kapp kbld kctrl kwt vendir ytt)
source_x86_64=(imgpkg-v0.39.0::https://github.com/carvel-dev/imgpkg/releases/download/v0.39.0/imgpkg-linux-amd64 kapp-v0.59.1::https://github.com/carvel-dev/kapp/releases/download/v0.59.1/kapp-linux-amd64 kbld-v0.38.1::https://github.com/carvel-dev/kbld/releases/download/v0.38.1/kbld-linux-amd64 kctrl-v0.48.2::https://github.com/carvel-dev/kapp-controller/releases/download/v0.48.2/kctrl-linux-amd64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-amd64 vendir-v0.37.0::https://github.com/carvel-dev/vendir/releases/download/v0.37.0/vendir-linux-amd64 ytt-v0.46.0::https://github.com/carvel-dev/ytt/releases/download/v0.46.0/ytt-linux-amd64)
source_aarch64=(imgpkg-v0.39.0::https://github.com/carvel-dev/imgpkg/releases/download/v0.39.0/imgpkg-linux-arm64 kapp-v0.59.1::https://github.com/carvel-dev/kapp/releases/download/v0.59.1/kapp-linux-arm64 kbld-v0.38.1::https://github.com/carvel-dev/kbld/releases/download/v0.38.1/kbld-linux-arm64 kctrl-v0.48.2::https://github.com/carvel-dev/kapp-controller/releases/download/v0.48.2/kctrl-linux-arm64 kwt-v0.0.8::https://github.com/carvel-dev/kwt/releases/download/v0.0.8/kwt-linux-arm64 vendir-v0.37.0::https://github.com/carvel-dev/vendir/releases/download/v0.37.0/vendir-linux-arm64 ytt-v0.46.0::https://github.com/carvel-dev/ytt/releases/download/v0.46.0/ytt-linux-arm64)
sha256sums_x86_64=(98b80baa5d665c5119fc8e2a62978f9d193c9647e3c47ab72867b055b94d14ff a6da34c733514c2c51b96a12e70cd050250a45b2ee75d6966a904e712b307d15 00e114286588307d0785c4bfb1bb8f68acca1ea186eb79cd8475214214413291 d46ceb6bdff62a5fdfd80db00a21cf309475868e360aae0669535e032389f930 1022483a8b59fe238e782a9138f1fee6ca61ecf7ccd1e5f0d98e95c56df94d87 f1472bf7995506830fa79473f0ae406ea3885e0881fbbb096240efb1b053dd15 348cb34965b64c07fd5118e69efd9a4fae7e22f57db4e91e2d9903c1ad19f041)
sha256sums_aarch64=(7b247c24850dbf4ff70095b6d7f5aff12aea15d0ece9e9ecf66f92e3c9d2f332 a0e4eccdc264b535d7b0ba1972b6fd29cd5aa1263ab7e996d5a4671253fd3cf9 dba78f59d887cc7433595a1e7754fcbc3a7a53f5fbbb23b2798d95114795ce78 1ffdc8cd9d48b68789c567458b046ee57636981dd3e7b6eb93cc43ea6af6dad1 7b94a134cbde5ff2e245d102f54b9ac9f81b3fcc5e54a5cefecc1e5845b8a65f 7dde14730aa5a58511fc5b95f61162892ec97f87c9a57c01ab91d1f9f3d7aa74 9552c863452622386b9e9fcab0eb0533b6e8c77bc3f5c753967d40232b2a1721)
package () 
{ 
    install -Dm 755 "${srcdir}/imgpkg-v0.39.0" "${pkgdir}/usr/bin/imgpkg";
    install -Dm 755 "${srcdir}/kapp-v0.59.1" "${pkgdir}/usr/bin/kapp";
    install -Dm 755 "${srcdir}/kbld-v0.38.1" "${pkgdir}/usr/bin/kbld";
    install -Dm 755 "${srcdir}/kctrl-v0.48.2" "${pkgdir}/usr/bin/kctrl";
    install -Dm 755 "${srcdir}/kwt-v0.0.8" "${pkgdir}/usr/bin/kwt";
    install -Dm 755 "${srcdir}/vendir-v0.37.0" "${pkgdir}/usr/bin/vendir";
    install -Dm 755 "${srcdir}/ytt-v0.46.0" "${pkgdir}/usr/bin/ytt"
}

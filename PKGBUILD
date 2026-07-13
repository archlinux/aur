# Maintainer: Cleboost <clement.balarot@gmail.com>
# Contributor: missing-aur project <https://github.com/Cleboost/missing-aur>

pkgname=glitchtip-cli-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Open source CLI for GlitchTip (precompiled binary)"
url="https://gitlab.com/glitchtip/glitchtip-cli"
arch=("x86_64" "aarch64")
provides=("glitchtip-cli")
conflicts=("glitchtip-cli")
options=("!strip")
license=("MIT")

source_x86_64=("glitchtip-cli-${pkgver}-x86_64::${url}/-/jobs/artifacts/v${pkgver}/raw/artifacts/glitchtip-cli-linux-x86_64?job=build-linux-x86_64")
source_aarch64=("glitchtip-cli-${pkgver}-aarch64::${url}/-/jobs/artifacts/v${pkgver}/raw/artifacts/glitchtip-cli-linux-arm64?job=build-linux-arm64")
sha256sums_x86_64=('de1c035aa61931a6265d7b29b1614781dfee925466142a907508cb097082dfef')
sha256sums_aarch64=('781b8ba3fefe10d1586fb03438f7f6cbfdceccdb70b7fac0ee23342476d9af3a')

package() {
  install -Dm755 "glitchtip-cli-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/glitchtip-cli"
}


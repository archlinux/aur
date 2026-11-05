# Maintainer: Geoff Jukes <geoff@geoffjay.com>
# PKGBUILD for tower-bin — binary package sourcing the release tarball from
# GitHub. Regenerated per release by scripts/gen-aur-pkgbuild.sh (URLs and
# checksums are substituted verbatim; the checked-in template is never
# modified by hand per-release).
#
# See docs/knowledgebase/concepts/releases.md for the release workflow.
pkgname=tower-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Control and visibility for herds of coding agents"
arch=("aarch64" "x86_64")
url="https://github.com/geoffjay/tower"
license=("MIT" "Apache-2.0")
provides=("tower")
conflicts=("tower" "tower-git")

source_aarch64=("https://github.com/geoffjay/tower/releases/download/v0.8.0/tower-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('eac0d9cb71b8029298e661a2e6c896a3c03d3b2681ee39f6a616afcf759e9a77')

source_x86_64=("https://github.com/geoffjay/tower/releases/download/v0.8.0/tower-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('a0cf096f53b5f8373298a21fd573cdf8452d3d236391e43d5154a15eb9dac3aa')

package() {
    install -Dm755 "tower" "${pkgdir}/usr/bin/tower"
    install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}

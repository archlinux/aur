# Maintainer: Geoff Jukes <geoff@geoffjay.com>
# PKGBUILD for tower-bin — binary package sourcing the release tarball from
# GitHub. Regenerated per release by scripts/gen-aur-pkgbuild.sh (URLs and
# checksums are substituted verbatim; the checked-in template is never
# modified by hand per-release).
#
# See docs/knowledgebase/concepts/releases.md for the release workflow.
pkgname=tower-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Control and visibility for herds of coding agents"
arch=("aarch64" "x86_64")
url="https://github.com/geoffjay/tower"
license=("MIT" "Apache-2.0")
provides=("tower")
conflicts=("tower" "tower-git")

source_aarch64=("https://github.com/geoffjay/tower/releases/download/v0.1.1/tower-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('86d1e7842e4acd9cab74e91c544286b00e8f0ab0bcf054f6aeda00f00fbaedd5')

source_x86_64=("https://github.com/geoffjay/tower/releases/download/v0.1.1/tower-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('de5440bff6213e4ed613f5d1d12c5579bca9ac503e2caff8a6f207b9b8e3a17f')

package() {
    install -Dm755 "tower" "${pkgdir}/usr/bin/tower"
    install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}

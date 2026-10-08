# Maintainer: Geoff Jukes <geoff@geoffjay.com>
# PKGBUILD for tower-bin — binary package sourcing the release tarball from
# GitHub. Regenerated per release by scripts/gen-aur-pkgbuild.sh (URLs and
# checksums are substituted verbatim; the checked-in template is never
# modified by hand per-release).
#
# See docs/knowledgebase/concepts/releases.md for the release workflow.
pkgname=tower-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Control and visibility for herds of coding agents"
arch=("aarch64" "x86_64")
url="https://github.com/geoffjay/tower"
license=("MIT" "Apache-2.0")
provides=("tower")
conflicts=("tower" "tower-git")

source_aarch64=("https://github.com/geoffjay/tower/releases/download/v0.1.0/tower-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('PLACEHOLDER_AARCH64')

source_x86_64=("https://github.com/geoffjay/tower/releases/download/v0.1.0/tower-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('PLACEHOLDER_X86_64')

package() {
    install -Dm755 "tower" "${pkgdir}/usr/bin/tower"
    install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}

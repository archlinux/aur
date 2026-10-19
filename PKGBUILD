# Maintainer: Geoff Johnson <geoff.jay@gmail.com>
# PKGBUILD for gdot-bin — binary package sourcing the release tarball from
# GitHub. Regenerated per release by scripts/gen-aur-pkgbuild.sh (URLs and
# checksums are substituted verbatim; the checked-in template is never
# modified by hand per-release).
pkgname=gdot-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Modular, versioned dotfile manager"
arch=("aarch64" "x86_64")
url="https://github.com/geoffjay/dot"
license=("MIT" "Apache-2.0")
provides=("dot")
conflicts=("dot" "dot-git")

source_aarch64=("https://github.com/geoffjay/dot/releases/download/v0.1.0/dot-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('d349ca12c23119c98b8ea439448607ba3208aba52d090a31c5abcf5009ef4d6e')

source_x86_64=("https://github.com/geoffjay/dot/releases/download/v0.1.0/dot-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('6af5cfc1ad1f1e360e0f173f514dcbc5a1b0812692db18c6ad4523e0da0aeb2e')

package() {
    install -Dm755 "dot" "${pkgdir}/usr/bin/dot"
    install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}

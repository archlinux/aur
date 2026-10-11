# Maintainer: Bryan Joshua Pedini <bryan [at] pedini [dot] dev>

pkgname="skeptical-updater"
pkgver="0.1.1"
pkgrel="1"
pkgdesc="A manual, conscious update cycle for apt, dnf/yum, pacman/pman and zypper"
url="https://git.bjphoster.com/source/${pkgname}"
arch=("any")
license=("GPL-2.0-or-later")
depends=("bash" "pacman")
optdepends=("sudo: re-exec as root when run unprivileged"
            "pman-helper: shows the pman label")
source=("https://git.bjphoster.com/source/${pkgname}/archive/${pkgver}.tar.gz")

sha256sums=("23d0fcfaaf655d6e90567eb1aa3ed3b953b85e82e62009ae44566b4ccf8783ed")

package() {
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${srcdir}/${pkgname}/skeptical-updater" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/${pkgname}/docs/DESIGN.md" "${pkgdir}/usr/share/doc/${pkgname}/DESIGN.md"
}

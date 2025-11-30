# Maintainer: Your Name <your.email@example.com>

pkgname=wisp-calendar
pkgver=0.2.5
pkgrel=1
pkgdesc="A beautiful text-based calendar with visual aesthetics for Arch Linux"
arch=('any')
url="https://github.com/Gianluska/wisp-calendar"
license=('MIT')
depends=('bash' 'coreutils')
makedepends=()
install="${pkgname}.install"

# The source files are in the same directory as the PKGBUILD
source=("git+https://github.com/Gianluska/wisp-calendar.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
    # Source files are already present
    :
}

build() {
    # Nothing to compile
    :
}

package() {
    # Install the executable (from cloned repo directory)
    install -Dm755 "${srcdir}/${pkgname}/wisp-calendar" "${pkgdir}/usr/bin/wisp-calendar"
}

# vim:set ts=4 sw=4 et:

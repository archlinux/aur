# Maintainer: Gianlucca Claudino <gianluccaclaudino@gmail.com>

pkgname=lvsk-calendar
pkgver=0.2.7
pkgrel=1
pkgdesc="A beautiful text-based calendar with visual aesthetics for Arch Linux"
arch=('any')
url="https://github.com/Gianluska/lvsk-calendar"
license=('MIT')
depends=('bash' 'coreutils')
makedepends=()
install="${pkgname}.install"

# The source files are in the same directory as the PKGBUILD
source=("git+https://github.com/Gianluska/lvsk-calendar.git#tag=v${pkgver}")
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
    install -Dm755 "${srcdir}/${pkgname}/lvsk-calendar" "${pkgdir}/usr/bin/lvsk-calendar"
}

# vim:set ts=4 sw=4 et:

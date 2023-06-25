# Maintainer: FichteFoll <fichtefoll2@googlemail.com>

pkgname=aegisub-yutils
pkgver=2023.06.25
pkgrel=2
pkgdesc="Yutils library for the Aegisub Automation interface"
arch=('i686' 'x86_64')
url="https://github.com/TypesettingTools/Yutils"
license=('MIT')
depends=('aegisub')

# https://github.com/TypesettingTools/Yutils/blob/91a4ac771b08ecffdcc8c084592286961d99c5f2/src/Yutils.lua
source=("Yutils-${pkgver}.lua::https://github.com/TypesettingTools/Yutils/raw/91a4ac771b08ecffdcc8c084592286961d99c5f2/src/Yutils.lua")
sha256sums=('fee7110bd3051a6510bec611fe7634003f32c5e50d7b5503b52530dec94b2a7e')


package() {
    local prefix="/usr/share/aegisub/automation"

    install -D -m644 "Yutils-${pkgver}.lua" "${pkgdir}${prefix}/include/Yutils.lua"
}

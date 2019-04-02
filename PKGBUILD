# Maintainer: FichteFoll <fichtefoll2@googlemail.com>

pkgname=aegisub-yutils
pkgver=v2015.01.17
pkgrel=1
pkgdesc="Yutils library for the Aegisub Automation interface"
arch=('i686' 'x86_64')
url="https://github.com/Youka/Yutils"
license=('')
depends=('aegisub')

# https://github.com/Youka/Yutils/raw/T1/src/Yutils.lua
source=("Yutils-${pkgver}.lua::https://github.com/Youka/Yutils/raw/T1/src/Yutils.lua")
sha256sums=('45c199bf3e4897a0fca5dfc21a7e53da14ea9ee757c7d919145cab2324200a39')


package() {
    local prefix="/usr/share/aegisub/automation"

    install -D -m644 "Yutils-${pkgver}.lua" "${pkgdir}${prefix}/include/Yutils.lua"
}

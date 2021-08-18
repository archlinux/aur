# Maintainer: zswdcx <c60@outlook.de>

pkgname=xray-setcap-pacman-hook
pkgver=1
pkgrel=1
pkgdesc="Pacman hook to setcap xray after xray install/upgrade."
arch=("any")
license=("GPL")
depends=('coreutils')
source=(xray-setcap.hook)
sha256sums=("e827fb27b0acef24b6bf25ba9c29caeebedf91985164819b4b8ac578a70e302b")

package() {
    install -Dm644 "${srcdir}/xray-setcap.hook" "${pkgdir}/usr/share/libalpm/hooks/xray-setcap.hook"
}


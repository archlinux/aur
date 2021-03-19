# Maintainer: darsvador <Lx3JQkmzRS@protonmail.com>

pkgname=v2ray-setcap-pacman-hook
pkgver=1
pkgrel=1
pkgdesc="Pacman hook to setcap v2ray after v2ray install/upgrade."
arch=("any")
license=("GPL")
depends=('coreutils')
source=(v2ray-setcap.hook)
sha256sums=("d0c01d5ffe3bc99f5530e1145398d37703fb0ffcfc3de0dfecdf9dd1afa9db2a")

package() {
    install -Dm644 "${srcdir}/v2ray-setcap.hook" "${pkgdir}/usr/share/libalpm/hooks/v2ray-setcap.hook"
}


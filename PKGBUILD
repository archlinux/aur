# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname="run-as"
pkgver=0.1
pkgrel=1
pkgdesc="Run an application as another user."
arch=('any')
url="https://aur.archlinux.org/packages/run-as"
depends=("systemd"
         "python")
license=("AGPL3")
source=("run-as.py"
        "enable-graphical-services.sh")
sha256sums=("1768c50f35ce3a8761f69281cee16b314b7a14542b558793839c08dd9c880001"
            "eeb723ea96283edb1dc33fe71c412d2687dec132cd691ee77a839f9e7658890b")

package() {
  install -Dm755 "${srcdir}/run-as.py" \
                 "${pkgdir}/usr/bin/run-as"
  install -Dm755 "${srcdir}/enable-graphical-services.sh" \
                 "${pkgdir}/usr/bin/enable-graphical-services"
}


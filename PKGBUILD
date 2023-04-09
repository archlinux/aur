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
sha256sums=("d91e45ff5855f2ceb90d3e06c2b1a3d986cd0d9636d93d83af9a75a335be3507"
            "521921a95ddcc645de77ba2d6714a9d34b01d37633f93a8caee8d42fad9dedcc")

package() {
  install -Dm755 "${srcdir}/run-as.py" \
                 "${pkgdir}/usr/bin/run-as"
  install -Dm755 "${srcdir}/enable-graphical-services.sh" \
                 "${pkgdir}/usr/bin/enable-graphical-services"
}


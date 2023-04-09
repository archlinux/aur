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
sha256sums=("fdd3ad400570f7e404c5c8482d94c2dd3273df3c1266594ac7c2a7967dd115ac"
            "521921a95ddcc645de77ba2d6714a9d34b01d37633f93a8caee8d42fad9dedcc")

package() {
  install -Dm755 "${srcdir}/run-as.py" \
                 "${pkgdir}/usr/bin/run-as"
  install -Dm755 "${srcdir}/enable-graphical-services.sh" \
                 "${pkgdir}/usr/bin/enable-graphical-services"
}


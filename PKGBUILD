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
sha256sums=("6806472dafc87482d007c694233fb7c1418bf5e900f30170619165ef9db444d9"
            "521921a95ddcc645de77ba2d6714a9d34b01d37633f93a8caee8d42fad9dedcc")

package() {
  install -Dm755 "${srcdir}/run-as.py" \
                 "${pkgdir}/usr/bin/run-as"
  install -Dm755 "${srcdir}/enable-graphical-services.sh" \
                 "${pkgdir}/usr/bin/enable-graphical-services"
}


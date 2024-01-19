# Maintainer: Meowkate

pkgname=yacd-meta-service
pkgver=0.1.0
pkgrel=1
pkgdesc="yacd-meta webui systemd user service"
arch=('any')
license=('custom: CC0 1.0 Universal')
depends=('miniserve' 'yacd-meta' 'systemd')
source=("yacd-meta.service")
sha512sums=('9e76e27152cb206513d52ca1d0cf4fb4c1f0cfcd9e0ce1beacec2597ab7b10fd76fdfa5049154499ac4cb623f0a31eaf00819b7e54f93c5d5e2b15197099297d')

package() {
  install -vDm644 -t "${pkgdir}"/usr/lib/systemd/user yacd-meta.service
}


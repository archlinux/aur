pkgname='mairen-bin'
pkgver=2.0.0
pkgrel=1
pkgdesc="透麦仁"
arch=('any')
source=("mairen.sh"
        "mai.sh")
        sha256sums=('c69f1d1c62ea95a7923a0ccf9ce4bfa85829c5cc73cd8ef964619f1c2be5fc22'
            'de75f0e15b0f32ca774bc4178c01a4893cf0d2de651a301d1b3b473f354a95a2')
package() {
  install -Dm755 "mairen.sh" "$pkgdir/usr/bin/mairen"
  install -Dm755 "mai.sh" "$pkgdir/usr/bin/mai"
}

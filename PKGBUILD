# Maintainer: JohnHolmesII <jedistephen@hotmail.com>

pkgname=hare-hook-runit
pkgver=0.9.1
pkgrel=1
pkgdesc='Runit service for hare-hook'
arch=(any)
url=https://harehook.net
license=(Unlicense)
depends=(hare-hook)
source=(run)
sha256sums=('e9a6f13c431d4022a46748f0705244569ec90d11423bd4fe5b3887d52791c3a4')

package() {
  install -Dm0755 run "$pkgdir/etc/runit/sv/hare-hook/run"
}

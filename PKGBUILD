# Maintainer: Echo https://github.com/CallMeEchoCodes
pkgname=fetcho
pkgver=0.0.1
pkgrel=1
pkgdesc='A lightweight neofetch alternative!'
arch=('any')
url="https://github.com/CallMeEchoCodes/fetcho"
license=('MIT')
provides=( fetcho )
source=("fetcho::https://github.com/CallMeEchoCodes/fetcho/releases/download/$pkgver/fetcho")
sha256sums=('933f6c8df148491090eacc09631e85b5a93383a0a905a113369f2b2676c6b9f8')
package() {
   install -Dm755 "$srcdir/fetcho" "$pkgdir/usr/bin/fetcho"
}

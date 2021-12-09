# Maintainer: Jens Heremans <jensheremans[at]gmail[dot]com>

pkgname=kcs9-git
pkgver=0.0.1
pkgrel=1
pkgdesc="A no-nonsense kubernetes context switcher"
arch=('x86_64')
url="https://github.com/JorisJamers/KUBECONFIGSWITCHER9000"
license=('unknown')
source=("https://github.com/JorisJamers/KUBECONFIGSWITCHER9000/releases/download/v$pkgver/KCS9")
sha256sums=('cf28fe4be99fb16b068e92fc1b19c009cb2afc824af0917c432effdf0ba6c3ac')

package() {
  install -Dm755 "KCS9" "$pkgdir/usr/bin/KCS9"
}

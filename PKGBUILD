pkgname=goonsh
pkgver=1.0.2
pkgrel=1
pkgdesc="a joke fr"
arch=('x86_64')
url="https://github.com/DriftFe/goonsh"
license=('GPL3')
depends=('gcc' 'glibc')
source=("https://raw.githubusercontent.com/DriftFe/goonsh/main/goonsh.cpp")
sha256sums=('SKIP')

build() {
  g++ goonsh.cpp -o goonsh -lreadline    
}

package() {
  install -Dm755 "$srcdir/goonsh" "$pkgdir/usr/bin/goonsh"
}

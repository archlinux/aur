pkgname=goonsh
pkgver=2.0.1
pkgrel=1
pkgdesc="a joke fr"
arch=('x86_64')
url="https://github.com/DriftFe/goonsh"
license=('GPL3')
depends=('readline')
source=(
  "https://raw.githubusercontent.com/DriftFe/goonsh/main/goonsh.cpp"
  "https://raw.githubusercontent.com/DriftFe/goonsh/main/utils.cpp"
  "https://raw.githubusercontent.com/DriftFe/goonsh/main/history.cpp"
  "https://raw.githubusercontent.com/DriftFe/goonsh/main/config.cpp"
  "https://raw.githubusercontent.com/DriftFe/goonsh/main/completion.cpp"
  "https://raw.githubusercontent.com/DriftFe/goonsh/main/utils.h"
  "https://raw.githubusercontent.com/DriftFe/goonsh/main/history.h"
  "https://raw.githubusercontent.com/DriftFe/goonsh/main/config.h"
  "https://raw.githubusercontent.com/DriftFe/goonsh/main/completion.h"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

build() {
  g++ goonsh.cpp utils.cpp history.cpp config.cpp completion.cpp -o goonsh -lreadline
}

package() {
  install -Dm755 "$srcdir/goonsh" "$pkgdir/usr/bin/goonsh"
}

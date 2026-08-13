# Maintainer: bombo <bombo@localhost>

pkgname=chat-control
pkgver=1.0.0
pkgrel=1
pkgdesc="Europe chat-control"
arch=('any')
url="https://github.com/Momwhyareyouhere"
license=('MIT')
depends=()
source=()
sha256sums=()

package() {
  printf 'lol\n'
  install -d "$pkgdir/usr/bin" "$pkgdir/usr/share/chat-control"
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/chat-control" <<'EOF'
#!/bin/sh
printf 'lol\n'
EOF
  printf 'lol\n' > "$pkgdir/usr/share/chat-control/lol.txt"
}

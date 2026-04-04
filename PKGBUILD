pkgname=meutestepkg
pkgver=1.0
pkgrel=1
pkgdesc="Pacote de teste seguro para aprender a criar pacotes Pacman"
arch=('any')
license=('GPL')
source=()
sha256sums=()

package() {
    mkdir -p "$pkgdir/usr/bin"
    echo -e '#!/bin/bash\n\necho "Hello, este é um pacote de teste seguro!"' > "$pkgdir/usr/bin/meutestepkg"
    chmod +x "$pkgdir/usr/bin/meutestepkg"
}

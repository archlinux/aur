# Maintainer: dhe <reaper16983@googlemail.com>
pkgname=vboxmanage-bash-completion
pkgver=1.0
pkgrel=1
pkgdesc="VBoxManage bash completion script"
arch=('any')
license=('BSD')
depends=('bash')
source=("git+https://github.com/gryf/vboxmanage-bash-completion")

package() {
    install -Dm644 "$srcdir/vboxmanage-bash-completion/VBoxManage" "$pkgdir/usr/share/bash-completion/completions/vboxmanage"
}
sha512sums=('SKIP')

# Maintainer: Fritz Qe <nextlext@gmail.com>

pkgname=lext-add-repo
pkgver=1
pkgrel=1
pkgdesc="Adds a personal (private) lext-next [repo] section to Pacman configuration"

arch=('any')
license=('custom:none')
depends=()
source=()
md5sums=()

package() {
    install -d "$pkgdir/etc/pacman.d"
    cat > "$pkgdir/etc/pacman.d/lext-repo.conf" <<EOF
[repo]
SigLevel = Optional TrustAll
Server = http://lext-store.duckdns.org/\$repo/os/\$arch
EOF
}

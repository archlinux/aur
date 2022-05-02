pkgname=arch-btw
pkgver=0.1.0
pkgrel=1
pkgdesc='arch-btw - A package to make you neofetch say "Arch BTW".'
arch=('any')
license=('GPL')
conflicts=("lsb-release")
provides=('lsb-release')

package() {
        cd "${pkgdir}"
	mkdir etc
	cat > etc/lsb-release<<EOF
DISTRIB_ID="Arch"
DISTRIB_RELEASE="rolling"
DISTRIB_DESCRIPTION="Arch BTW"
EOF
}


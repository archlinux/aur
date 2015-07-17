pkgname="flashplugin-must-die"
pkgver=1.0
pkgrel=1
pkgdesc='Hinder flashplugin from being installed on your system.'
arch=('any')
url='https://aur4.archlinux.org/packages/flashplugin-must-die'
license=('BSD')
provides=('flashplugin')
conflicts=('flashplugin')

build() {
cd "${srcdir}"
cat <<-'EOF' >README
This package conflicts with flashplugin, so you have to uninstall Flash. By
adding this package to your systems and voting for it in the AUR, you
advocate for a world without the horror that is the Flash plugin.
EOF
}

package() {
cd "${srcdir}"
install -D -m 0444 README "${pkgdir}/usr/share/doc/flashplugin-must-die/README"
}

# Maintainer: LordDemecrius83 <lorddemecrius83@proton.me>

pkgname=artix-pipewire-loader
pkgver=1.0
pkgrel=1
pkgdesc="Pipewire Loader for Artix based on Gentoo's Pipewire Loader"
arch=('any')
license=('GPL3')
makedepends=()
depends=()
conflicts=()
options=(!strip)

source=('artix-pipewire-loader'
'pwldr.desktop')

sha256sums=('ae4900c8b68cd3594a9938220a3ef2ba56d6357129648f7976ae349d5e284599'
            '45e3b438d62f24c7ac4e16fc20afd19ef8f04a348eaa6cf3cb1716706c91b22a')

package() {
	install -Dm 755 artix-pipewire-loader   		${pkgdir}/usr/bin/artix-pipewire-loader
	install -Dm 644 pwldr.desktop	    ${pkgdir}/etc/xdg/autostart/pwldr.desktop
}

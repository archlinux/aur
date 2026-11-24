# Maintainer: darkmagicsauce <caitlyn dot williams at proton dot me>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=eac-reboot-entry
pkgver=2.0.0
pkgrel=1
pkgdesc="A script shim to make booting into an EAC kernel a bit easier"
arch=('any')
license=('CC0-1.0')
depends=(
        'cachyos-settings>=1.4.5'
        'kdialog'
        'linux-cachyos-eac'
        'polkit'
)
optdepends=('breeze-icons: default desktop entry references a Breeze icon')
source=(
        "reboot-eac"
        "reboot-eac.desktop"
)

package() {
	install -Dm755 "${srcdir}/reboot-eac" -t "${pkgdir}/usr/bin/"
	install -Dm644 "${srcdir}/reboot-eac.desktop" -t "${pkgdir}/usr/share/applications"
}

sha256sums=(
        '54302c4064ada655a8472c22e51f2646baf0c682a7a8272e5be15f83bda85ab1'
        '726e5c11b86243e15cdfea0a23970eacb5bd0cecccec2e3bff91b9bb808fb6c9'
)

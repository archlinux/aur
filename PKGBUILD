# Maintainer: darkmagicsauce <caitlyn dot williams at proton dot me>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=eac-reboot-entry
pkgver=1.1.0
pkgrel=1
pkgdesc="A script shim to make booting into an EAC kernel a bit easier"
arch=('any')
license=('Unlicense')
depends=('linux-cachyos-eac' 'systemd' 'hicolor-icon-theme' 'kdialog')
source=("reboot-eac"
        "reboot-eac.desktop")

package() {
	install -Dm755 "${srcdir}/reboot-eac" -t "${pkgdir}/usr/bin/"
	install -Dm644 "${srcdir}/reboot-eac.desktop" -t "${pkgdir}/usr/share/applications"
}

sha256sums=('43b9ce54e177b653a008e4de7d1d856d73641ede1785badcf3be591028abb47b'
            '726e5c11b86243e15cdfea0a23970eacb5bd0cecccec2e3bff91b9bb808fb6c9')

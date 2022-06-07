# Maintainer: KuoHuanHuan <hi@nekohuan.cyou>

pkgname=ungoogled-chromium-binary
pkgver=102.0.5005.61
pkgrel=3
epoch=1
pkgdesc='A lightweight approach to removing Google web service dependency (binary release)'
arch=(x86_64)
url=https://github.com/Eloston/ungoogled-chromium
license=(BSD)
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt' 'ttf-liberation' 'systemd' 'dbus' 'libpulse' 'pciutils' 'libva' 'desktop-file-utils' 'hicolor-icon-theme'
				)
optdepends=('pipewire: WebRTC desktop sharing under Wayland'
            'kdialog: support for native dialogs in Plasma'
            'org.freedesktop.secrets: password storage backend on GNOME / Xfce'
            'kwallet: support for storing passwords in KWallet on Plasma'
						)
provides=('chromium')
conflicts=("ungoogled-chromium" "chromium")
options=()
source=(
				"https://github.com/ungoogled-software/ungoogled-chromium-archlinux/releases/download/$pkgver-$pkgrel/ungoogled-chromium-$pkgver-$pkgrel-x86_64.pkg.tar.zst"
				)
noextract=("ungoogled-chromium-$pkgver-$pkgrel-x86_64.pkg.tar.zst")
sha256sums=('565924751aec3d6237419abe5d632dd469bd7680c456c91baaa785353bf40244')

prepare() {
	uname -r # Outputs kernel info
}
package() {
	msg2 "downloaded package."
}

pkgname=plome
pkgver=5.91.0
pkgrel=1
pkgdesc='PLOME, mix of Plasma desktop and GNOME applications'
arch=(x86_64)
license=(LGPL)
depends=(
	plasma-desktop
	# audio volume control
	plasma-pa
	# drop-down terminal
	yakuake
	# input method framework
	fcitx5-im
	# preferred keychain
	gnome-keyring
	seahorse
	# preferred network management UI
	network-manager-applet
	# preferred Bluetooth management UI
	blueman
	# prefer Flatpak for regular applications
        flatpak
	discover
	xdg-desktop-portal-kde
)
conflicts=(
	# use fcitx5 instead
	ibus
	# use network-manager-applet instead
	plasma-nm
	# use blueman instead
	bluedevil
	# use discover for flatpak only
	packagekit-qt6
)

build() {
  echo "TODO"
}

package() {
  DESTDIR="$pkgdir" echo "TODO"
}

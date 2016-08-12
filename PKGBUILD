# Maintainer: Sonic-Y3k <sonic.y3k@goolemail.com>
# Contributor: normanu <normanu@gmail.com>

pkgname=intel_nuc_apple_remote
pkgver=1.0
pkgrel=2
pkgdesc="Reconfigure Intel NUCs IR-Receiver to get Apple Remote (A1294) input and pass it to Kodi."
arch=('any')
url="https://forums.plex.tv/index.php/topic/103833-definitive-intel-nuc-how-to-guide-surround-sound-over-hdmi-apple-remote-graphics/"
license=('GPL')
source=("apple_remote_sab")
sha256sums=("cdbf327ae24e0a446c5dcce3d69b95164e519bdae15bdb833162f558874fa6cc")
install="intel_nuc_apple_remote.install"

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir/etc/rc_keymaps"
	install -Dm 644 "${srcdir}/apple_remote_sab" "$pkgdir/etc/rc_keymaps/appleremote"
}

# Maintainer: purpleleaf <max@ganoia.eu>
pkgname=zzzfm-bin
pkgver=1.0.7
pkgrel=2
pkgdesc="zzzFM is a multi-panel tabbed file and desktop manager for Linux with built-in VFS, udev device manager, customizable menu system and bash integration. This is the GTK2 version"
url="https://gitlab.com/skidoo/zzzfm"
arch=(x86_64)
source=("https://gitlab.com/antix-contribs/zzzfm/-/raw/contribs/deb-packages/zzzfm_1.0.7-6~contribs2_amd64.deb")
license=('GPL3')
depends=('cairo>=1.2.4' 'desktop-file-utils' 'e2fsprogs' 'gdk-pixbuf2' 'glib2>=2.41.1' 'glibc>=2.28' 'gtk2>=2.24.32' 'hicolor-icon-theme' 'udev' 'libx11' 'pango' 'shared-mime-info' 'zzzfm-common-bin=1.0.7' )
optdepends=('bash-completion' 'curlftpfs' 'dbus' 'fuseiso' 'gksu' 'gphotofs' 'ifuse' 'jmtpfs' 'sshfs' 'udisks2' 'util-linux')
provides=('zzzfm')
conflicts=('zzzfm-gtk3')
sha256sums=('2081744a2f2ae0ecdcf5ba27079bffc4b042773d9b91ab899b0bc81fd6c78f64')

package() {
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
}

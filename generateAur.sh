pkgver=2.0.13
pkgrel=1
echo "# Maintainer: Michael Latman <mlatman@gmail.com>
pkgname=whatsie
pkgver=$pkgver
pkgrel=$pkgrel
epoch=
pkgdesc=\"A simple & beautiful desktop client for WhatsApp Web.\"
arch=('any')
url=\"https://whatsie.chat\"
license=('MIT')
groups=()
depends=(\"dpkg\")
makedepends=()
checkdepends=()
optdepends=('lsb-release')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=\".INSTALL\"
changelog=
source=()
noextract=()
md5sums=()
validpgpkeys=()
package(){
wget \"https://github.com/Aluxian/Whatsie/releases/download/v\$pkgver/whatsie-\$pkgver-linux-amd64.deb\" -P build_step/
dpkg -x \"build_step/whatsie-\$pkgver-linux-amd64.deb\" \"\$pkgdir/\"

}
md5sums=()" > PKGBUILD


echo "pkgname = whatsie
pkgver = $pkgver
pkgdesc = A simple & beautiful desktop client for WhatsApp Web.
url = https://whatsie.chat
builddate = 1460577681
packager = whatsie
arch = x86_64
size = 140662880
license = MIT
backup = etc/xdg/autostart/whatsie.desktop
depend = bash-completion
depend = desktop-file-utils
depend = gconf
depend = gtk2
depend = gvfs
depend = hicolor-icon-theme
depend = libcap
depend = libgcrypt
depend = libgcrypt11
depend = libnotify
depend = libsystemd
depend = libxtst
depend = nss
depend = xdg-utils
optdepend = gir1.2-gnomekeyring-1.0
optdepend = libgnome-keyring
optdepend = lsb-release" > .PKGINFO

echo "pkgbase = whatsie
	pkgver = $pkgver
	pkgrel = $pkgrel
	arch = any
	license = MIT
	depends = dpkg
pkgname = whatsie" > .SRCINFO

git add -A
git commit -m "Release $pkgver PackageRel $pkgrel"
git push AUR master
yaourt -S whatsie

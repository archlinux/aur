# Maintainer: Joseph Dalrymple <joseph.dalrymple@bluelogicteam.com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: loqs
# Contributor: Jorge Araya Navarro <jorgejavieran@yahoo.com.mx>
# Contributor: Cristian Porras <porrascristian@gmail.com>
# Contributor: Matthew Bentley <matthew@mtbentley.us>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Toolybird <toolybird at tuta dot io>

pkgname=godot-double-bin
pkgver=4.4.1
pkgrel=1
arch=(x86_64)
url="https://godotengine.org/"
license=(MIT)
provides=("godot-double")
conflicts=("godot-double")
source=("godot-double-4.4.1-1-x86_64.pkg.tar.zst::https://github.com/Norpyx-Godot/godot-double/releases/download/v4.4.1-1/godot-double-4.4.1-1-x86_64.pkg.tar.zst")
noextract=("godot-double-4.4.1-1-x86_64.pkg.tar.zst")
sha256sums=('d0587cddd36f1671f7f7d1086a722efd5b743d52829becbae0b2fc08357ab74f')

package() {
	bsdtar -xf "${srcdir}/godot-double-4.4.1-1-x86_64.pkg.tar.zst" -C "${pkgdir}" --strip-components=0 usr
}

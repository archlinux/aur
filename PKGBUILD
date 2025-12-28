# Maintainer: Joseph Dalrymple <joseph.dalrymple@bluelogicteam.com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: loqs
# Contributor: Jorge Araya Navarro <jorgejavieran@yahoo.com.mx>
# Contributor: Cristian Porras <porrascristian@gmail.com>
# Contributor: Matthew Bentley <matthew@mtbentley.us>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Toolybird <toolybird at tuta dot io>

pkgname=godot-double-bin
pkgver=4.5.1
pkgrel=0
pkgdesc='Advanced cross-platform 2D and 3D game engine (double-precision build)'
arch=(x86_64)
url="https://godotengine.org/"
license=(MIT)
provides=("godot-double")
conflicts=("godot-double")
source=("godot-double-4.5.1-0-x86_64.pkg.tar.zst::https://github.com/Norpyx-Godot/godot-double/releases/download/v4.5.1-0/godot-double-4.5.1-0-x86_64.pkg.tar.zst")
noextract=("godot-double-4.5.1-0-x86_64.pkg.tar.zst")
sha256sums=('bbba34a009e62906d111ef89468fc35aacd531f8e44b36de4c6ae176ceaa49c7')

package() {
	bsdtar -xf "${srcdir}/godot-double-4.5.1-0-x86_64.pkg.tar.zst" -C "${pkgdir}" --strip-components=0 usr
}

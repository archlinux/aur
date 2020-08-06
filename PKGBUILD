# Maintainer: Husam Bilal <husam212@gmail.com>

pkgname=komorebi-bin
pkgver=2.2.0
pkgrel=1
pkgdesc="Parallax backgrounds manager"
install=komorebi-bin.install
arch=("x86_64")
url="https://github.com/Komorebi-Fork/komorebi"
license=("GPL")
depends=("desktop-file-utils" "glib2>=2.38" "gtk3>=3.14" "hicolor-icon-theme" "libgtop" "libgee" "libwnck" "clutter" "clutter-gtk" "clutter-gst" "webkit2gtk")
md5sums=("b48f5d61e73e8357ba0a7c82d69216ed")
source=("https://github.com/Komorebi-Fork/komorebi/releases/download/v${pkgver}/komorebi_${pkgver}-1_amd64.deb")

package() {
	tar xf data.tar.xz -C "${pkgdir}"
}

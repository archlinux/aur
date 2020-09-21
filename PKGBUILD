# Maintainer: Husam Bilal <me@husam.dev>

pkgname=komorebi-bin
pkgver=2.2.1
pkgrel=2
pkgdesc="Parallax backgrounds manager"
arch=("x86_64")
url="https://github.com/Komorebi-Fork/komorebi"
provides=("komorebi")
conflicts=("komorebi")
license=("GPL")
url="https://github.com/Komorebi-Fork/komorebi"
depends=("libgee" "clutter-gtk" "clutter-gst" "webkit2gtk")
optdepends=("gst-libav: full video wallpaper support"
						"gstreamer-vaapi: hardware-accelerated video decoding through VAAPI"
						"gst-plugins-bad: hardware-accelerated video decoding through VDPAU")
md5sums=("b48f5d61e73e8357ba0a7c82d69216ed")
source=("https://github.com/Komorebi-Fork/komorebi/releases/download/v${pkgver}/komorebi_${pkgver}-1_amd64.deb")

package() {
	tar xf data.tar.xz -C "${pkgdir}"
}

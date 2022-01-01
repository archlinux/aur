# Maintainer: Pedro A. López-Valencia <https://aur.archlinux.org/user/vorbote>
# Maintainer: Yichao Zhou <broken.zhou@gmail.com>
pkgname=texlive-upstream
pkgver=2
pkgrel=1
pkgdesc="If you install TeXLive by hand, this package REPLACES the distro packages and replaces some AUR conflicts."
url="http://www.tug.org/texlive/"
arch=('any')
license=('GPL')
provides=('texlive-full' 'texlive-installer' 'texlive-most-doc' 'texlive-bin' 'texlive-htmlxml' $(pacman -Sgq texlive-most texlive-lang))
replaces=('texlive-full' 'texlive-installer' 'texlive-most-doc' 'texlive-bin' 'texlive-htmlxml' $(pacman -Sgq texlive-most texlive-lang))
conflicts=('texlive-full' 'texlive-installer' 'texlive-most-doc' 'texlive-bin' 'texlive-htmlxml' $(pacman -Sgq texlive-most texlive-lang))

package() {
	mkdir -p "$pkgdir"/usr/share/doc/texlive-upstream
	echo "If you install TeXLive by hand, this package provides fake" > "$pkgdir"/usr/share/doc/texlive-upstream/README
	echo "distribution packages and some conflicting packages in AUR." >> "$pkgdir"/usr/share/doc/texlive-upstream/README
	echo "" >> "$pkgdir"/usr/share/doc/texlive-upstream/README
	echo "It works for me. Cry me a river." >> "$pkgdir"/usr/share/doc/texlive-upstream/README
	echo "" >> "$pkgdir"/usr/share/doc/texlive-upstream/README
	echo "The author." >> "$pkgdir"/usr/share/doc/texlive-upstream/README
}

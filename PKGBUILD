# Maintainer: Pedro A. López-Valencia <https://aur.archlinux.org/user/vorbote>
# Maintainer: Yichao Zhou <broken.zhou@gmail.com>
pkgname=texlive-upstream
pkgver=1
pkgrel=1
pkgdesc="If you install TeXLive by hand, this package provides fake distro packages."
url="http://www.tug.org/texlive/"
arch=('any')
license=('GPL')
provides=('texlive-full' 'texlive-installer' 'texlive-most-doc' 'texlive-bin' 'texlive-htmlxml' $(pacman -Sgq texlive-most texlive-lang))
replaces=('texlive-full' 'texlive-installer' 'texlive-most-doc' 'texlive-bin' 'texlive-htmlxml' $(pacman -Sgq texlive-most texlive-lang))
conflicts=('texlive-full' 'texlive-installer' 'texlive-most-doc' 'texlive-bin' 'texlive-htmlxml' $(pacman -Sgq texlive-most texlive-lang))

package() {
	exit 0
}

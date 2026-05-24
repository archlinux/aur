# Maintainer: Olivia Mackintosh <liv@base.nu>

pkgname=nodalred2x-clap-bin
pkgver=2.2.4
pkgrel=1
pkgdesc="Emulation of classic digital synthesizers and effects processors."
arch=(x86_64)
url="https://theusualsuspects.io/"
license=(GPLv3)
groups=(clap-plugins)
makedepends=(git)
provides=("${pkgname%-*}")
source=("https://github.com/dsp56300/gearmulator/releases/download/2.2.4/TheUsualSuspects-NodalRed2x-CLAP-2.2.4-Linux_x86_64.zip")
sha256sums=('3ab2058b0208a795d28acf7f2909f2409ab8d05d2921e42aee1efb8453b1b931')

package() {
  cp -r usr/ $pkgdir/
}

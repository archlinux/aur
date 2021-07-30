# Maintainer: Marc Plano-Lesay <kernald@enoent.fr>

pkgname=brother-hll5100dn-cups-bin
pkgver=3.5.1.1
pkgrel=1
pkgdesc="CUPS wrapper for Brother HL-L5100DN printer"
arch=("i686" "x86_64")
url="http://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=hll5100dn_us_eu_as"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf102554/hll5100dncupswrapper-3.5.1-1.i386.deb")
sha256sums=("8b7d3d9618c4e854cd77c7f4778befeffa1a354b75eb9b1c53d1b395f7fc81c1")

package() {
	tar -xf data.tar.gz -C "${pkgdir}"
}

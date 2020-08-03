# Maintainer: Oscar Harris <oscar@oscar-h.com>

pkgname=brother-dcp-l5500dn-cups-bin
pkgver=3.5.1
pkgrel=1
pkgdesc="CUPS wrapper for Brother DCP-L5500DN printer"
arch=("i686" "x86_64")
url="http://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=dcpl5500dn_us_eu"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf102578/dcpl5500dncupswrapper-3.5.1-1.i386.deb")
sha512sums=("e8d36c4c83dd221f978a4a3de4fb317c9c831be2d573ac90750896f559a32a35a1c7c1501775c358cc7b455250fdfea4881c97e3f7c60ad61818869c1da0a0af")

package() {
	tar -xf data.tar.gz -C "${pkgdir}"
}

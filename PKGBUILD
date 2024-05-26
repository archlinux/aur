# Maintainer: Amir M. Joshaghani <amjoshaghani@gmail.com>
pkgname='pfshare'
pkgver='0.0.2'
pkgrel='1'
pkgdesc='Graphical User Interface for the PFShare project.'
arch=("x86_64")
source=("https://github.com/AMJoshaghani/pfshare-app/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=("23c2d3063e8c1c7a6b4a1de1bd3dea40afa9b03a35435f94052173a3d92b90e22a93fbd022ec4e1f2e9de1f282585df3ae92ccc3e9925d8d269b691f4d2b483e")

package(){
	bsdtar -C "${pkgdir}" -xJf "${pkgname}-${pkgver}.tar.gz"
}
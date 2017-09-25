# Maintainer: elementh <lucasmmarino@icloud.com>
pkgname=flatplat-blue-theme
pkgrel=1
_date=20170917
_gnomever=3.25.1
pkgver=${_gnomever}.${_date}
pkgver=3.24.1
pkgdesc="Flat-Plat-Blue Theme is a GNOME Shell/GTK Theme forked from Flat-Plat Theme with blue tones"
arch=(any)
url="https://github.com/peterychuang/Flat-Plat-Blue"
license=('GPL2')
depends=('gtk3>=3.18' 'gtk-engine-murrine' 'gnome-themes-standard')
optdepends=()
provides=('flatplat-blue-theme')
conflicts=()
replaces=()
source=("https://github.com/peterychuang/Flat-Plat-Blue/releases/download/${_gnomever}/Flat-Plat-Blue-${_date}.tar.gz")
sha256sums=('5d67946346f804dba239aa8c025363bebd3554cc6034a5c8c153ba11cc25eab5')

package() {
    destdir="${pkgdir}" ./install.sh
}

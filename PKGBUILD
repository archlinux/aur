# Maintainer: taotieren <admin@taotieren.com>

pkgname=openocdcfg-generator
pkgver=20.08.00.00
pkgrel=1
epoch=
pkgdesc="This is a python tool based on pydevicetree (GitHub/PyPI) which generates OpenOCD Configuration Files for Freedom Metal applications."
arch=('any')
url="https://github.com/sifive/openocdcfg-generator"
license=('Apache')
groups=()
depends=('python' 'openocd' 'python-jinja-time' 'python-markupsafe' 'python-pylint' 'python-pydevicetree')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://download.fastgit.org/sifive/openocdcfg-generator/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('a348e9688502b88ede43c8a40b0d8a29d52620482361b2c7c0d4106b3d91a50c')
#validpgpkeys=()

package() {
    install -Dm0755 "${srcdir}/${pkgname}-${pkgver}/generate_openocdcfg.py" "${pkgdir}/usr/bin/${pkgname}"

}

# Maintainer: banana-bred <j.forer@posteo.net>

pkgname=fortran-fpm-bin
_name=fpm
pkgver=0.10.0
pkgrel=1
epoch=
pkgdesc='A Fortran package manager and build system'
arch=('x86_64')
url='https://fpm.fortran-lang.org/'
license=('MIT')
groups=()
depends=('git')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=("${_name}" "${pkgname%-bin}")
replaces=()
backup=()
options=()
install=
changelog=
noextract=()
source=(
  "https://github.com/fortran-lang/fpm/releases/download/v${pkgver}/${_name}-${pkgver}-linux-${arch}"
  "https://raw.githubusercontent.com/fortran-lang/fpm/main/LICENSE"
)
sha256sums=(
  '5d54c1f39a088b9c9a7bec13366c6901df4abddf1be39448e112a5f0385cdc12'
  'b7e33601c0130d1a674fcc772ed9b7804460d1896469a5b219ba4062efcd9fb9'
)

package() {
	install -Dm 755 "${srcdir}/${_name}-${pkgver}-linux-${arch}" "${pkgdir}/usr/bin/${_name}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et :

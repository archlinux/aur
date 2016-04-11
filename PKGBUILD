# Maintainer: Dick Choi <fluke8259@gmail.com>
# Contributor: Romain Bazile <gromain.baz@gmail.com>
pkgname=boostnote
pkgver=0.5.8
pkgrel=1
pkgdesc="Opensource note app for developer"
arch=('x86_64')
url="https://b00st.io/"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=

source=(
  "https://github.com/BoostIO/boost-releases/releases/download/v0.5.9/boost_0.5.9_amd64.deb"
  )

noextract=()

md5sums=('df56bf3167dddb3eb2e1b263c65e61ba')

validpgpkeys=()

package() {
      tar -xa -f ${srcdir}/data.tar.xz
        cp -r "${srcdir}/usr" "${pkgdir}/usr"
}


# Maintainer: Dick Choi <fluke8259@gmail.com>
# Contributor: Romain Bazile <gromain.baz@gmail.com>
pkgname=boostnote
pkgver=0.6.3
pkgrel=1
pkgdesc="Opensource note app for developer"
arch=('x86_64')
url="https://b00st.io/"
license=('GPL')

source=(
  "https://github.com/BoostIO/boost-releases/releases/download/v$pkgver/boostnote_${pkgver}_amd64.deb"
  )

noextract=()

md5sums=('38fa1de3fc57215cc678adbefc5dad3d')

validpgpkeys=()

package() {
      tar -xa -f ${srcdir}/data.tar.xz
        cp -r "${srcdir}/usr" "${pkgdir}/usr"
}


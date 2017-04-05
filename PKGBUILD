# Maintainer: Jannick Hemelhof <mister.jannick@gmail.com>
# Contributor: Dick Choi <fluke8259@gmail.com>
# Contributor: Romain Bazile <gromain.baz@gmail.com>
pkgname=boostnote
pkgver=0.8.7
pkgrel=1
pkgdesc="Open source note-taking app for programmers"
arch=('x86_64')
url="https://b00st.io/"
license=('GPL')

source=("https://github.com/BoostIO/boost-releases/releases/download/v$pkgver/boostnote_${pkgver}_amd64.deb")

md5sums=('732f6631a49005676b6a5d348336a3f0')

package() {
  tar -xa -f ${srcdir}/data.tar.xz
  cp -r "${srcdir}/usr" "${pkgdir}/usr"
}


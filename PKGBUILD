pkgname=gollum-bin
pkgver=6.0.0
pkgrel=1
pkgdesc="A simple, Git-powered wiki with a sweet API and local frontend. Via upstream's bin"
arch=(x86_64)
url='http://github.com/gollum/gollum'
license=(MIT)
depends=(java-runtime-headless)
install=gollum-bin.install
source=("gollum-${pkgver}.war::https://github.com/gollum/gollum/releases/download/v${pkgver}/gollum.war")
noextract=("gollum-${pkgver}.war")
sha256sums=('e09fc85e849b364476e05d1c520900ef9491c0c218eda5f185665b4d9fa09171')

package() {
  install -D -m644 gollum-${pkgver}.war "${pkgdir}/opt/gollum/gollum.war"
}

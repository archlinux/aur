pkgname=gollum-bin
pkgver=5.3.2
pkgrel=1
pkgdesc="A simple, Git-powered wiki with a sweet API and local frontend. Via upstream's bin"
arch=(x86_64)
url='http://github.com/gollum/gollum'
license=(MIT)
depends=(java-runtime-headless)
install=gollum-bin.install
source=("gollum-${pkgver}.war::https://github.com/gollum/gollum/releases/download/v${pkgver}/gollum.war")
noextract=("gollum-${pkgver}.war")
sha256sums=('ce32a8bf4b2c29f22409598fb0d361487932a7ad05d28a495abf65b5179fec95')

package() {
  install -D -m644 gollum-${pkgver}.war "${pkgdir}/opt/gollum/gollum.war"
}

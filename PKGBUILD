Got pkgrel 3 on the AUR.
Got version 0.115.3 on the AUR.
Incrementing pkgrel...
# Maintainer: xeptore
# Contributor: Porous3247 <pqtb3v7t at jasonyip1 dot anonaddy dot me>
pkgname=gohugo-bin
pkgver=0.115.3
pkgrel=4
pkgdesc="Hugo - The world's fastest framework for building websites"
arch=('x86_64' 'aarch64')
url='https://gohugo.io/'
license=('Apache')
depends=('glibc')
conflicts=('hugo')
provides=('hugo')
source_x86_64=('https://github.com/gohugoio/hugo/releases/download/v0.115.3/hugo_0.115.3_linux-amd64.tar.gz')
source_aarch64=('https://github.com/gohugoio/hugo/releases/download/v0.115.3/hugo_0.115.3_linux-arm64.tar.gz')
sha256sums_x86_64=('f05178bd260a2408606f90734eff669463233c90d7949b91f109cdee81486315')
sha256sums_aarch64=('c49f7798527893030f9f4430de0811df279b3ce434616288370f63fa2b848cce')

package() {
  cd "${srcdir}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/hugo"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/hugo"
  install -Dm755 "hugo" -t "${pkgdir}/usr/bin"
}

# Maintainer: Firegem <mrfiregem [at] protonmail.ch>
pkgname=arturo-bin
_pkgname=${pkgname%-bin}
pkgver=0.9.80
pkgrel=1
pkgdesc='Simple, expressive & portable programming language for efficient scripting.'
arch=('x86_64')
url='https://arturo-lang.io/'
_url='https://github.com/arturo-lang/arturo'
license=('MIT')
depends=('glib2' 'gmp' 'gtk3' 'webkit2gtk')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-Linux-full.tar.gz")
sha256sums=('843af01c68d67e8e19733e6671905d39e28eb0a78613f5cfc76f57d171255101')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" arturo
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" README.md
}

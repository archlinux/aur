# Maintainer: Nils Grunwald <nils [@] grunwald [dot] fr>

pkgname=jet-bin
pkgver=0.0.13
pkgrel=1
pkgdesc='CLI to transform between JSON, EDN and Transit, powered with a minimal query language.'
arch=('x86_64')
url='https://github.com/borkdude/jet'
license=('EPL')
provides=('jet')
conflicts=()

source=("https://github.com/borkdude/jet/releases/download/v${pkgver}/${pkgname/\-bin/}-${pkgver}-linux-amd64.zip")

sha256sums=('e09effc645a7e9d478e9aa57c0bfdde1f0dfd26f94a6e8e6241437b59f3672ba')

package() {
  install -Dm755 "${srcdir}/jet" "${pkgdir}/usr/bin/jet"
}

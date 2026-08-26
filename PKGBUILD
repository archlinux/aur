# Maintainer: Joerg Weislogel <mutoroglin [at] posteo [dot] de>

pkgname=snip-llm-bin
pkgver=0.24.1
pkgrel=1
pkgdesc="CLI proxy that filters shell output before it reaches your AI coding assistant's context window"
arch=('x86_64')
url='https://github.com/edouard-claude/snip'
license=('MIT')
makedepends=('tar')
options=(!debug)
source=("${pkgname}_${pkgver}-${pkgrel}.tar.gz::https://github.com/edouard-claude/snip/releases/download/v0.24.1/snip_${pkgver}_linux_amd64.tar.gz")

sha256sums=('6f230ab6d66885b73f7de4fd32399cb6a60f64de92133dc25532cccbfb930985')

package() {
  install -D -m755 snip "${pkgdir}/usr/bin/snip"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_MIT"
}

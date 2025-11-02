# Maintainer : imnyang <me@imnya.ng>

pkgname='dsync'
pkgver=25.11.1
pkgrel=3
pkgdesc='A tool that makes it easy to mirror Linux repositories.'
arch=('x86_64')
url='https://docs.krfoss.org/rokfoss/dsync'
license=('unlicense')
depends=('rsync')

source=("http://download.krfoss.org/dsync")
sha256sums=('6c6f5499dc023c11579ef48829f6c0bd7a48ff9edb87a07e9f251ea1f0a6f7ba')

package() {
    install -Dm755 "${srcdir}/dsync" "${pkgdir}/usr/bin/dsync"
}

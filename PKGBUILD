# Maintainer : imnyang <me@imnya.ng>

pkgname='dsync'
pkgver=25.10.1
pkgrel=2
pkgdesc='A tool that makes it easy to mirror Linux repositories.'
arch=('x86_64')
url='https://docs.krfoss.org/rokfoss/dsync'
license=('unlicense')
depends=('rsync')

source=("https://download.krfoss.org/dsync")
sha256sums=('b32e53368015531dd2482b4520adc00b14ff57d015614fd4a22a9340a52b4ece')

package() {
    install -Dm755 "${srcdir}/dsync" "${pkgdir}/usr/bin/dsync"
}

# Mantainer: tiziodcaio
# Contributor: dreieck
# Contributor: mikl_ls  <mikl_ls at protonmail dot com>

pkgname=tuned-openrc
pkgver=1.0.0
pkgrel=0
pkgdesc="Daemon that performs monitoring and adaptive configuration of devices in the system as an OpenRC service"
arch=('any')
url='https://github.com/redhat-performance/${pkgbase}'
license=('GPL3')
depends=('tuned' 'tuned-ppd')
source=("tuned" "tuned-ppd")
b2sums=('c1ea2175b9ace4ca0d0d02b6c2d570cf2c16395087d7af6a9e10ff6585985a33d8bf9189b4a8b353e56720017b1005b018d3d68e2a05c5f2c9a2c26254dcb760'
        'db4af70f059bec3118f258c450fe536819b1e426ab978ed276c9be8ba4465936949b41d255c5bf278b4bc91b0c0f6247866abb4f615d12a1025d56b734fb9b69')

package() {
  install -Dm755 ${srcdir}/tuned "$pkgdir"/etc/init.d/tuned
  install -Dm755 ${srcdir}/tuned-ppd "$pkgdir"/etc/init.d/tuned-ppd
}

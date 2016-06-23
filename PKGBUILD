# Maintainer: Christopher Loen <christopherloen at gmail dot com>
pkgname='python-perf'
pkgver='0.1'
pkgrel=1
pkgdesc='Interface with the Linux profiling infrastructure'
arch=('x86_64')
url='https://perf.wiki.kernel.org'
license=('GPL2')
depends=('python2')
source=('ftp://195.220.108.108/linux/fedora/linux/updates/24/x86_64/p/python-perf-4.5.7-300.fc24.x86_64.rpm')
sha256sums=('c6f913f3a842a52be1549ff92a05cbbacf673a83e9b6e2b1d3d5a2ea50c8b95f')


package() {
            cd "${srcdir}/usr/lib64/python2.7/site-packages/"
            install -dm755 "${pkgdir}/usr/lib/python2.7/site-packages/"
            cp * "${pkgdir}/usr/lib/python2.7/site-packages/"
}

# Maintainer: chn <g897331845@gmail.com>

pkgname=concurrent-queue
pkgdesc="A fast multi-producer, multi-consumer lock-free concurrent queue for C++11"
pkgver=1.0.3
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/cameron314/concurrentqueue"
license=('BSD')
source=("https://github.com/cameron314/concurrentqueue/archive/refs/tags/v${pkgver}.tar.gz")
options=('!libtool' '!debug')
md5sums=('118e5bb661b567634647312991e10222')

package() {
  mkdir -p ${pkgdir}/usr/include/concurrentqueue
  install -m644 "${srcdir}/concurrentqueue-${pkgver}/blockingconcurrentqueue.h" "${pkgdir}/usr/include/concurrentqueue"
  install -m644 "${srcdir}/concurrentqueue-${pkgver}/concurrentqueue.h" "${pkgdir}/usr/include/concurrentqueue"
  install -m644 "${srcdir}/concurrentqueue-${pkgver}/lightweightsemaphore.h" "${pkgdir}/usr/include/concurrentqueue"

  mkdir -p "${pkgdir}/usr/share/licenses/concurrent-queue"
  install -m644 "${srcdir}/concurrentqueue-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/concurrent-queue"
}

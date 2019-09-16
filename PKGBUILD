# Maintainer: Lorenzo Fontana <lo@linux.com>
pkgname=kubectl-trace-bin
pkgver=0.1.0_rc.0
pkgrel=1
pkgdesc="Schedule bpftrace programs on your kubernetes cluster using the kubectl (official binary version)"
arch=('x86_64')
conflicts=('kubectl-trace')
url="https://github.com/iovisor/kubectl-trace"
license=('MIT')
provides=('kubectl-trace')
source=(kubectl-trace_x64_${pkgver//_/-}.tar.gz::https://github.com/iovisor/kubectl-trace/releases/download/v${pkgver//_/-}/kubectl-trace_${pkgver//_/-}_linux_amd64.tar.gz)

sha256sums=('ba9724bf62004db903028508836f05bffecd6d501b348f5e655b035b12da107e')

package() {
    install -Dm755 "$srcdir/kubectl-trace" "$pkgdir/usr/bin/kubectl-trace"
}

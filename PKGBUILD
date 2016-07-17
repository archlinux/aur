# Maintainer: larte <lauri.arte@gmail.com>
pkgname=kubectl-bin
pkgdesc="Kubernetes.io client binary"
pkgver=1.3.0
pkgrel=2
arch=('i686' 'x86_64')
url="http://kubernetes.io"
license=('apache')
source_i686=(http://storage.googleapis.com/kubernetes-release/release/v$pkgver/bin/linux/386/kubectl)
source_x86_64=(http://storage.googleapis.com/kubernetes-release/release/v$pkgver/bin/linux/amd64/kubectl)
md5sums_i686=('3ac0846e260b931f1e95fe203b4ce5b0')
md5sums_x86_64=('09cdb4e370cb5bc77428550ee5a2cf71')

package() {
    install -d "${pkgdir}"/usr/bin/
    install -D "${srcdir}"/kubectl "$pkgdir/usr/bin/"

}

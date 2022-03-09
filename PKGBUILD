pkgname=kubernetes-secret-decode-bin
pkgver=3.0.0
pkgrel=0
pkgdesc="Be able to easily see the values of a secret."
arch=('x86_64')
url="https://github.com/ashleyschuett/kubernetes-secret-decode"
license=('Apache-2.0')
conflicts=('kubernetes-secret-decode-git')
source=("https://github.com/ashleyschuett/kubernetes-secret-decode/releases/download/v${pkgver}/kubernetes-secret-decode_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('599e16041aa84f8a57812a860a6cc87d144eaa5126af953269e28577ed716e1b')

package() {
    tar xfz kubernetes-secret-decode_${pkgver}_Linux_x86_64.tar.gz
    install -D -m755 "kubectl-ksd" -T "$pkgdir/usr/bin/kubectl-ksd"
}

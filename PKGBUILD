# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=kubernetes-helm
pkgver=2.2.1
pkgrel=1
pkgdesc="A tool to manage Kubernetes charts"
arch=('i686' 'x86_64')
url="https://github.com/kubernetes/helm"
optdepends=('kubectl-bin: Check Kubernetes status')
license=('Apache')
source_i686=("https://storage.googleapis.com/kubernetes-helm&helm-v$pkgver-linux-386.tar.gz")
source_x86_64=("https://storage.googleapis.com/kubernetes-helm/helm-v$pkgver-linux-amd64.tar.gz")
sha512sums_i686=('d15571e3c934f3a04e6f042783cfbe49c419fd7177c0b2e0c8bcd7cbe5017864e50e081965d06dcbe2cf21b7648489bb8b1934d76b8d61b7535fd1bd3a50432f')
sha512sums_x86_64=('11dc84ecdb6c5bb04334cbdbd2e7870b173f5fd6c23e35ecb1d177d55f5f325abdfbbf51f3f9a943c327de482ba46804810d2ebde0e7a433845093ca8bbc612a')

package() {
    cd "$srcdir"
    install -d "$pkgdir/usr/bin"
    install -m755 linux-*/helm "$pkgdir/usr/bin/helm"
}

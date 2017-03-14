# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=kubernetes-helm
pkgver=2.2.2
pkgrel=1
pkgdesc="A tool to manage Kubernetes charts"
arch=('i686' 'x86_64')
url="https://github.com/kubernetes/helm"
optdepends=('kubectl-bin: Check Kubernetes status')
license=('Apache')
source_i686=("https://kubernetes-helm.storage.googleapis.com/helm-v$pkgver-linux-386.tar.gz")
source_x86_64=("https://kubernetes-helm.storage.googleapis.com/helm-v$pkgver-linux-amd64.tar.gz")
sha512sums_i686=('d4815b020db6055da130c708680b78957bf3fc0a4aeb9b07ae4829e790e5a56d93e532164223b08aa8c1ad29eb696c4cd16f8cdeac329ed81009ffa51da7ae0f')
sha512sums_x86_64=('67759141e0f52f037052064bb997d8cc252c1383d95a436fbfbf2589bde5f9c9ed00e8ad48e70ba375049f2ae7e5d8e9f54696eb2bb3c7d6013b37e3dd52fdc4')

package() {
    cd "$srcdir"
    install -d "$pkgdir/usr/bin"
    install -m755 linux-*/helm "$pkgdir/usr/bin/helm"
}

# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=kubernetes-helm
pkgver=2.1.3
pkgrel=3
pkgdesc="A tool to manage Kubernetes charts"
arch=('i686' 'x86_64')
url="https://github.com/kubernetes/helm"
optdepends=('kubectl-bin: Check Kubernetes status')
license=('Apache')
source_i686=("https://kubernetes-helm.storage.googleapis.com/helm-v$pkgver-linux-386.tar.gz")
source_x86_64=("https://kubernetes-helm.storage.googleapis.com/helm-v$pkgver-linux-amd64.tar.gz")
sha512sums_i686=('909408a85e43be233e7fa4a130bafe3a7ea009111662b208a3e68ab2cb49c7ce1d592f99a514802b7e4121b14064b33159d41c5f59061147b1740ab3970304d9')
sha512sums_x86_64=('661416ec728eb33c151902e2bd59d548c98655500e297e40dc0c689a16bf5a84e8ee391f82c9f89a2b07178170bde003e8d853794b4e6f130d92f6d2614f926c')

package() {
    cd "$srcdir"
    install -d "$pkgdir/usr/bin"
    install -m755 linux-*/helm "$pkgdir/usr/bin/helm"
}

# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=kubernetes-helm
pkgver=2.2.0
pkgrel=1
pkgdesc="A tool to manage Kubernetes charts"
arch=('i686' 'x86_64')
url="https://github.com/kubernetes/helm"
optdepends=('kubectl-bin: Check Kubernetes status')
license=('Apache')
source_i686=("https://kubernetes-helm.storage.googleapis.com/helm-v$pkgver-linux-386.tar.gz")
source_x86_64=("https://kubernetes-helm.storage.googleapis.com/helm-v$pkgver-linux-amd64.tar.gz")
sha512sums_i686=('a6c961b4b1ab18735fc477e475b2dee2d9865cfda1df23694a7ed6df199b2c11d911a6d2330e0b279139a7aa11f68710e3c10b7cc849733bbb530a809825a564')
sha512sums_x86_64=('4ba6b7ef35799104f89ee9692d6f82ac22261cc58a901c9058c59af87af2b145309e1f71fd4cf5b91b16ff17c10b141cf47b8106b569d7e0dd00584f3f9e0117')

package() {
    cd "$srcdir"
    install -d "$pkgdir/usr/bin"
    install -m755 linux-*/helm "$pkgdir/usr/bin/helm"
}

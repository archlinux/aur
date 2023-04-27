# Maintainer: Andrew Shark <ashark on linuxcomp.ru>
pkgname=ocl-icd-choose
pkgver=1
pkgrel=1
pkgdesc="Specify a set of icd files from /etc/OpenCL/vendors that your application will see"
arch=('any')
license=('GPL')
url="https://gitlab.com/AndrewShark/ocl-icd-choose"
source=(https://gitlab.com/AndrewShark/ocl-icd-choose/-/raw/main/ocl-icd-choose)
sha256sums=("785ae389eb674415c2267835b31e812b9f9af7a285264f6e7e06a5df994d268e")

package() {
    install -Dm755 "${srcdir}"/ocl-icd-choose "${pkgdir}"/usr/bin/ocl-icd-choose
}


# Maintainer: Nandor Magyar < nandor magyar dot it at gmail dot com>

_name=azcopy
pkgname=azcopy-bin
pkgver=10.24.0
pkgrel=3
pkgdesc="A command-line utility that you can use to copy data to and from containers and file shares in Azure Storage accounts."
arch=('x86_64')
url="https://github.com/Azure/azure-storage-azcopy"
license=('MIT')
provides=("${_name}")
conflicts=("${_name}")
source=("https://aka.ms/downloadazcopy-v10-linux")
sha256sums=('4932dd2bd3b97631938ab2bf9f73b73a7a2a9b62f0daa9341006fc64c4833883')

package() {
    install -Dm755 "${_name}_linux_amd64_${pkgver}/${_name}" "$pkgdir"/usr/bin/"${_name}"
    install -Dm644 "${_name}_linux_amd64_${pkgver}/${_name}" -t "$pkgdir/usr/share/licenses/$pkgname"
}

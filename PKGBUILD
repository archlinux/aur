# Maintainer: Nandor Magyar < nandor magyar dot it at gmail dot com>

_name=azcopy
pkgname=azcopy-bin
pkgver=10.23.0
pkgrel=1
pkgdesc="A command-line utility that you can use to copy data to and from containers and file shares in Azure Storage accounts."
arch=('x86_64')
url="https://github.com/Azure/azure-storage-azcopy"
license=('MIT')
provides=("${_name}")
conflicts=("${_name}")
source=("https://aka.ms/downloadazcopy-v10-linux")
sha256sums=('69a72297736edd1afa068efc2ee0704baa819c49d6ca9d1a2950a5fff18b8431')

package() {
    install -Dm755 "${_name}_linux_amd64_${pkgver}/${_name}" "$pkgdir"/usr/bin/"${_name}"
    install -Dm644 "${_name}_linux_amd64_${pkgver}/${_name}" -t "$pkgdir/usr/share/licenses/$pkgname"
}

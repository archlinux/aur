# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=azcopy-10
pkgver=10.0.0
pkgrel=1
pkgdesc="A command-line utility designed for copying data to/from Microsoft Azure"
arch=('x86_64')
url="https://docs.microsoft.com/en-us/azure/storage/common/storage-use-azcopy"
license=('unknown')
source=("${pkgname}-${pkgver}.tar.gz::https://aka.ms/downloadazcopy-v10-linux")
sha512sums=('387ba9faea7c214814cc99373be9ec7ed73aee3bbc7db6667683b31cc156d27e8b84ae93e895b9a23908301bbe8fc0941f5c0fcd5ed2703c686d082c649436ae')
options=(!strip libtool staticlibs)
depends=('openssl-1.0')

package() {
  cd "${srcdir}/azcopy_linux_amd64_${pkgver}"
  install -Dm755 azcopy "${pkgdir}/usr/bin/azcopy"
}

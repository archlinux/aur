# Maintainer: JustKidding <jk@vin.ovh>
pkgname=libfuzzer-header
pkgver=1.0
pkgrel=1
pkgdesc="FuzzedDataProvider header required for some program's debug builds"
arch=(any)
url="https://llvm.org/"
license=("custom:Apache 2.0 with LLVM Exception")
source=(FuzzedDataProvider.h)
sha256sums=(7f1ef1d73446f0fe3a3fc3a651ee159f024361599c2673eab7f2feb87ec3d716)

package() {
    install -Dm644 FuzzedDataProvider.h "$pkgdir/usr/include/fuzzer/FuzzedDataProvider.h"
}

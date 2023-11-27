# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>
pkgname=ydb-cli-bin
pkgver=2.7.0
pkgrel=1
pkgdesc='YDB CLI is the client-side command line interface for YDB databases.'
arch=('x86_64')
url='https://ydb.tech/en/docs/reference/ydb-cli/'
license=('Apache')
makedepends=('curl')

YDB_STORAGE_URL='https://storage.yandexcloud.net/yandexcloud-ydb'

source=("ydb-${pkgver}::${YDB_STORAGE_URL}/release/${pkgver}/linux/amd64/ydb")
sha256sums=('b560f2958aa02fc414e7722d18cb737cca6bb74bcfb79e917fb1c5ebe12be0f4')

package() {
    install -D "${srcdir}/ydb-${pkgver}" "${pkgdir}/usr/bin/ydb"
}

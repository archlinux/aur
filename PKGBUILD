
# Maintainer: Aarav Maloo <aaravmaloo06@gmail.com>

pkgname=blob-bin

pkgver=1.1.1

pkgrel=1

pkgdesc="A minimal note manager that stays out of your way."

arch=('x86_64' 'aarch64')

url="https://github.com/aaravmaloo/blob"

license=('GPL-2.0-only')

provides=('blob')

conflicts=('blob')



source_x86_64=("https://github.com/aaravmaloo/blob/releases/download/v${pkgver}/blob-linux-amd64")

source_aarch64=("https://github.com/aaravmaloo/blob/releases/download/v${pkgver}/blob-linux-arm64")



sha256sums_x86_64=('a3a910dd76640579b209afb4c75781d25f2afac5ce7401f5e3668f8f61c8ee93')

sha256sums_aarch64=('0ae6bf74dd6746311e250450f8b3f49ed43bf210d736fc8bf8e542e744b2731a')



package() {

    if [ "$CARCH" = "x86_64" ]; then

        install -Dm755 "${srcdir}/blob-linux-amd64" "${pkgdir}/usr/bin/blob"

    else

        install -Dm755 "${srcdir}/blob-linux-arm64" "${pkgdir}/usr/bin/blob"

    fi

}


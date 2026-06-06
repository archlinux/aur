
# Maintainer: Aarav Maloo <aaravmaloo06@gmail.com>

pkgname=blob-bin

pkgver=1.0.0

pkgrel=1

pkgdesc="A minimal note manager that stays out of your way."

arch=('x86_64' 'aarch64')

url="https://github.com/aaravmaloo/blob"

license=('GPL-2.0-only')

provides=('blob')

conflicts=('blob')



source_x86_64=("https://github.com/aaravmaloo/blob/releases/download/v${pkgver}/blob-linux-amd64")

source_aarch64=("https://github.com/aaravmaloo/blob/releases/download/v${pkgver}/blob-linux-arm64")



sha256sums_x86_64=('6ba360fa78009d81230b916d387d02734f6ece0dc0e1999ad31cec2b784ac942')

sha256sums_aarch64=('494ceaf7ec471632316bccd75e9625c45ac7f3a129123166143a3249e6570742')



package() {

    if [ "$CARCH" = "x86_64" ]; then

        install -Dm755 "${srcdir}/blob-linux-amd64" "${pkgdir}/usr/bin/blob"

    else

        install -Dm755 "${srcdir}/blob-linux-arm64" "${pkgdir}/usr/bin/blob"

    fi

}


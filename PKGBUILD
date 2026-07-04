# Contributor: kaduvert
pkgname=kptools-bin
pkgver=0.13.2
pkgrel=3
pkgdesc="Patching and hooking the Linux kernel with only a stripped Linux kernel image."
arch=(
    'x86_64'
)
url="https://github.com/bmax121/KernelPatch"
license=('GPL-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}=${pkgver}")
depends=('glibc' 'zlib')
source_x86_64=("${pkgname%-bin}::${url}/releases/download/${pkgver}/${pkgname%-bin}-linux")
sha256sums_x86_64=('4f982ceb56a9cfdf24b7e93b4ab786bd83e1e27218655517c571c46baf4f57f6')
package() {
    install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin/"
}

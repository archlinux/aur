# Contributor: kaduvert
pkgname=kptools-bin
pkgver=0.13.3
pkgrel=1
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
sha256sums_x86_64=('02f47c3399c57c0a5620a29e2a09e1df43d23f0b07f0fb8838fa1924565268a2')
package() {
    install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin/"
}

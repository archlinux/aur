# Contributor: kaduvert
pkgname=kptools-bin
pkgver=0.13.4
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
sha256sums_x86_64=('c324a46487d8d1520377a936b6aeff75f8c6ed5d41e8202cb6bcda3b73cd91fa')
package() {
    install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin/"
}

# Contributor: kaduvert
pkgname=kptools-bin
pkgver=0.13.9
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
sha256sums_x86_64=('sha256:49f624f02afeb23c8c1d3c437f996c85f127fc9bc3f026f1e9182c866a6e57f0')
package() {
    install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin/"
}

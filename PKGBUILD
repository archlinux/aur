# Contributor: kaduvert
pkgname=kptools-bin
pkgver=0.13.5
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
sha256sums_x86_64=('93feb6340126983246bd9a654255f8ae8eb73ac56d1974156d33999a551a1f82')
package() {
    install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin/"
}

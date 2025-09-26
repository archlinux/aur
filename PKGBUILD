pkgname=uaspl-bin
pkgver=1.2.2
pkgrel=3
pkgdesc="UASPL Automatizado para la Seguridad y Protección de Linux"
arch=('x86_64')
url="https://github.com/KevinCrrl/UASPL"
license=('GPL3')
# No es necesario poner dependencias como Python, python-colorama, etc ya que el paquete está compilado por ende es independiente.
# Y solo necesita de estas mostradas abajo que se ejecutan en comandos dentro del programa, es decir no están integradas, solo se llaman para ser ejecutadas.
depends=('clamav' 'ufw' 'rkhunter' 'systemd' 'sudo' 'glibc' 'zlib')
source=("https://github.com/KevinCrrl/UASPL/releases/download/${pkgver}/uaspl-${pkgver}" "LICENSE")
sha256sums=('d382eddd46ece5fade84750d4ebb991e0dd8d26af67570cdf0707bd15f7ad310' 'SKIP')

package() {
    echo "uaspl-bin ya no es mantenido oficialmente, si quiere usar las versiones oficiales y recientes use el paquete uaspl"
    install -Dm755 "uaspl-${pkgver}" "$pkgdir/usr/bin/uaspl"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

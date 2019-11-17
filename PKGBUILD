pkgname=lanmessenger
pkgver=1.2.37
pkgrel=2
pkgdesc="An opensource LAN messenger"
arch=('x86_64')
url="https://github.com/lanmessenger/lanmessenger"
license=('None')
depends=('qt5-base' 'qt5-declarative' 'qt5-webkit' 'qt5-multimedia')
source=("${url}/releases/download/v${pkgver}/lmc-${pkgver}.x86_64_min.rpm")
sha512sums=('cbaf93e15acd11b258db425f4387835c32e898b8687227018d5422dac45efbc54fb9c2cdaf4e75c941c2ad74a1c6287d030d062c972540554a284bb93ce4035b')

package() {
    cd ${srcdir}/
    bsdtar -xf lmc-${pkgver}.x86_64_min.rpm -C ${pkgdir}
    find ${pkgdir}/usr/ -type d -exec /usr/bin/chmod 755 {} +;
}

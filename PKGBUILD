# Maintainer: Arturo Penen <apenen@gmail.com>

pkgname=terrax
pkgver=3.0.1
pkgrel=2
pkgdesc='Terrax is a simple orchestration tool that simplify the adoption of aws-vault, chamber and tfsec while terraforming.'
arch=('x86_64')
url='https://gitlab.com/alvaro-fdez/terrax'
license=('GPL3')
depends=('aws-vault' 'chamber' 'terraform' 'tfsec')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/alvaro-fdez/terrax/-/archive/v$pkgver/terrax-v$pkgver.tar.gz")
sha256sums=('ec22faba57b2c12d6427bdb46bb6de546c1621e9003a4a30069a314e2fff5196')

package() {
  install -Dm 755 "${pkgname}-v${pkgver}/terrax" "${pkgdir}/usr/bin/terrax"
}


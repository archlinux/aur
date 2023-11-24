# Maintainer: Arturo Penen <apenen@gmail.com>

pkgname=terrax
pkgver=3.1.0
pkgrel=1
pkgdesc='Terrax is a simple orchestration tool that simplify the adoption of aws-vault, chamber and tfsec while terraforming.'
arch=('x86_64')
url='https://gitlab.com/alvaro-fdez/terrax'
license=('GPL3')
depends=('aws-vault' 'chamber' 'terraform' 'tfsec')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/alvaro-fdez/terrax/-/archive/v$pkgver/terrax-v$pkgver.tar.gz")
sha256sums=('9e6b23f2a1b942896c71afd9835d7310901e382df892302a5b4a639f364eb48d')

package() {
  install -Dm 755 "${pkgname}-v${pkgver}/terrax" "${pkgdir}/usr/bin/terrax"
}


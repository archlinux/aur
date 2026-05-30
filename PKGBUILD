pkgname=obogrev-ng
pkgver=1.0.0
pkgrel=1
pkgdesc="Утилита для обогрева помещения с помощью стресс-теста CPU и GPU (Мда...)"
arch=('any')
url="https://github.com/Exabyte07"
license=('GPL')
depends=('stress-ng' 'gputest' 'bash')

source=("${pkgname}-${pkgver}::https://raw.githubusercontent.com/Exabyte07/obogrev-ng/refs/heads/main/obogrev-ng")
sha256sums=('f7a5961ebc3bca706d49ed996b94fe16dbbde1cd4ce539ce6445edc8902f3b09')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/obogrev-ng"
}

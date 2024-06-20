pkgname=zaproxy-shortcut
pkgver=1
pkgrel=0
pkgdesc='Integrated penetration testing tool for finding vulnerabilities in web applications (desktop shortcut)'
arch=('any')
url='https://www.owasp.org/index.php/ZAP'
license=('Apache')
depends=('zaproxy')
source=(owasp-zap.desktop
        owasp-zap.png)
sha512sums=('cc883faa68a14e98fb5c9e1e3aed6f066c0733a0bbe3846eadd7c162e284ecd69b8a8dcacd7816ea26e46a83cc9062f46e1158c93c891143a4a8c0fa816e6f53'
			'8316fde450a1dcf58cfee3819902f91816d1d3be150ce3367bfa6ec4c8c050c12fe7d8d14d205ab8584f4531bc67b08e2cdb3ad268b2eb42a00767fe769c4eb1')

package() {
  install -Dm 644 "${srcdir}"/owasp-zap.png -t "${pkgdir}"/usr/share/pixmaps/
  install -Dm 644 "${srcdir}"/owasp-zap.desktop -t "${pkgdir}"/usr/share/applications/
}

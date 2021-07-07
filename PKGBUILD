# Maintainer: bilabila <bilabila@qq.com>
pkgname=fish-xsession
pkgver=0.0.2
pkgrel=2
pkgdesc="fish -l as xsession from your display manager"
arch=(any)
license=(MIT)
provides=(fish-xsession)
source=(fish-xsession fish.desktop)
sha512sums=(411dd3547e0572bb5cacfaf43c50f147926775f31aad2109b05538ffec331fd601746548419700c1145e6cb46b0af8c2c55ecc67b5e5bb65b39702b1c58c084c
  0970a962ed68ad018054ff499ecfbc64baa5eae83389a7bcb2223109363d1795dcf71d9289ce7fa9805828b9e0e656c294dce1fe907bf73f033a5f695baa3cd2)
package() {
  install -d -m 755 ${pkgdir}/usr/bin
  cp fish-xsession ${pkgdir}/usr/bin/
  install -d ${pkgdir}/usr/share/xsessions
  cp fish.desktop ${pkgdir}/usr/share/xsessions/
}

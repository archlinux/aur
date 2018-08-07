## UPSTREAM:
# Author: Guillaume Chazarain <guichaz<at>gmail<dot>com>
# Maintainer: Enre Hasegeli <emre<at>hasegeli<dot>com>
# Maintainer: Patrick Meyer <git<at>the-space<dot>agency>

## PACKAGE:
# Maintainer: Mike Sampson <mike at sambodata dot com>
# Maintainer: Mikhail f. Shiryaev <mr<dot>felixoid<at>gmail<dot>com>

pkgname=polysh
pkgver=0.9
pkgrel=2
pkgdesc="This is a deprecated package. You have to use python-polysh"
arch=("any")
url="https://pypi.org/project/polysh/"
license=("GPL2")
depends=("python" "openssh")
makedepends=("python-setuptools" "python-docutils")
options=(!emptydirs)
source=("https://github.com/innogames/polysh/archive/polysh-${pkgver}.tar.gz")
sha256sums=("3f45061ad42fd9402fe6629e72e9f3d9f94b9f0b1401e76c3c1f69dcc713d2da")

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/polysh" <<EOF
#!/usr/bin/python
print('The "polysh" package is deprecated. Please, install "python-polysh" from AUR')
EOF
  chmod +x "${pkgdir}/usr/bin/polysh"
}

# vim:set ts=2 sw=2 et:

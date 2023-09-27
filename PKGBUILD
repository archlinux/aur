# Maintainer: Max G (CodesWhite) <aur@maxcode.me>

pkgname=yournal
pkgver=1.1.0.fb92bfc
pkgrel=1
pkgdesc="Fast (y)ournal script to make daily notes from your terminal"
arch=('any')
url='https://github.com/Rikiub/yournal.py'
license=('MIT')
depends=('python')

_repo_name="Rikiub/yournal.py"
source=("git+https://github.com/${_repo_name}")
sha256sums=('SKIP')

package() {
  cd "$(basename ${_repo_name})"
  git reflog | head -n1
  install -Dm755 "./yournal.py" "${pkgdir}/usr/bin/yournal"
}

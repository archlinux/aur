# Maintainer: Chris Severance aur.severach AatT spamgourmet.com

set -u
pkgname='git-aurcheck'
pkgver=0.5
pkgrel=1
pkgdesc='a helper like namcap that checks and offers solutions for common problems in git submissions to the AUR'
arch=('any')
license=('GPL')
depends=('bash' 'pkgbuild-introspection' 'git' 'pcre2')
source=("${pkgname}.sh")
source_i686='xyzzy'
sha256sums=('2be511ec4012b56c65a9ef3aef0f2b75b75eda7fccf06f656a9ba8ed88b22e12')

#install='installfoo'; source+=("${install}") # generate errors for us to detect
#changelog='changefoo'; source+=("${changelog}")

pkgver() {
  set -u
  sed -ne "s:^_opt_VERSION='\([^']\+\)'"'$:\1:p' "${pkgname}.sh"
  set +u
}

prepare() {
  set -u
  set +u
}

package() {
  set -u
  install -Dpm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  set +u
}
set +u

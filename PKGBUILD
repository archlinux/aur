# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=test-publishing-aur-package-using-github-action-a
pkgver=0.0.0
pkgrel=0
pkgdesc='This is a test package. It serves no other purposes.'
url='https://github.com/KSXGitHub/github-actions-deploy-aur.git'
arch=(any)
license=(WTFPL-2.0)
source=()
sha512sums=()

package() {
  msg 'Generating executable...'
  (
    echo '#!/bin/sh'
    echo 'echo Success'
  ) > /usr/bin/test-publishing-aur-package-using-github-action-0
  chmod a+x /usr/bin/test-publishing-aur-package-using-github-action-0
}

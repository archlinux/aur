# Maintainer: Hendrik 'T4cC0re' Meyer <aur@t4cc0.re>
pkgname=gitlab-cli
pkgver=0.1.7
pkgrel=1
pkgdesc="Perform GitLab actions on the CLI"
arch=('x86_64')
url="https://gitlab.com/T4cC0re/gitlab-cli"
license=('GPLv3')
source=("${pkgname}::https://gitlab.com/api/v4/projects/13375720/jobs/artifacts/${pkgver}/raw/bin/${pkgname}?job=build")
noextract=("${pkgname}")

package() {
  install -Dm755 $pkgname                              "$pkgdir/usr/bin/$pkgname"
}

sha512sums=(c51f2e8fdc3ff18c7907b831aee1b75ca14e58a2b295084b825193354924e3fa5153da3ecb1b03b05756431c7908bcb93852b0250687662f07e22e57dbb817db)

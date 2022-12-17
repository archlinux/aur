# Maintainer: tinnus-napbus <admin@tinnus-napbus.xyz>
# Contributor: Omar Roth <omarroth@protonmail.com>

pkgname=urbit
pkgver=1.14
pkgrel=1
pkgdesc="An operating function"
arch=('x86_64' 'aarch64')
url="https://github.com/urbit/urbit"
license=('MIT')
conflicts=('urbit-git')
source_x86_64=(https://bootstrap.urbit.org/vere/live/$pkgver/vere-v$pkgver-x86_64-linux)
sha256sums_x86_64=('ae3df3a2c42bde6df1b780955dac3742908185c610eb7e153eb8125821fa5033')
source_aarch64=(https://bootstrap.urbit.org/vere/live/$pkgver/vere-v$pkgver-aarch64-linux)
sha256sums_aarch64=('f535a49128a2cd5194f98b65f88c0d5124bc61cfaffc97cab5fc072f3816753c')

package() {
  install -Dm755 "${srcdir}/vere-v$pkgver-$CARCH-linux" "$pkgdir/usr/bin/urbit"
}

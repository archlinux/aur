# Maintainer: Reed Mullanix <reedmullanix@gmail.com>
pkgname=ecs-cli
pkgver=0.4.6
pkgrel=1
arch=(x86_64)
provides=(ecs-cli)
source=(https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest)
md5sums=('ccd6a54f8e76e105f0025fb629d0a7ba')
noextract=('ecs-cli-linux-amd64-latest')

package() {
  mkdir -p "$pkgdir"/usr/bin
  install -m755 ecs-cli-linux-amd64-latest "$pkgdir"/usr/bin/ecs-cli
}


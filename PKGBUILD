#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
org=zed-industries
realname=claude-code-acp
pkgname=$realname
pkgver=0.10.8
pkgrel=1
pkgdesc="Use Claude Code from any ACP client such as Zed!"
arch=('x86_64')
url="https://github.com/$org/$realname"
license=('Apache-2.0')
makedepends=('npm')
depends=('nodejs')
source=("https://registry.npmjs.org/@$org/$realname/-/$realname-$pkgver.tgz")
sha256sums=('be3d60f8a3f214d45e2b1c7c2d89d2d5a685391bea470a04832fc90aa1f72c55')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${realname}-${pkgver}.tgz"
}

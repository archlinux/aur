#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
org=zed-industries
realname=claude-code-acp
pkgname=$realname
pkgver=0.10.2
pkgrel=1
pkgdesc="Use Claude Code from any ACP client such as Zed!"
arch=('x86_64')
url="https://github.com/$org/$realname"
license=('Apache-2.0')
makedepends=('npm')
depends=('nodejs')
source=("https://registry.npmjs.org/@$org/$realname/-/$realname-$pkgver.tgz")
sha256sums=('3cb67719aca862a7b603e2b9acdd4c87ab2d79a107ca559dbdd1e5a8b43a63bb')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${realname}-${pkgver}.tgz"
}

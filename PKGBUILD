#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
org=zed-industries
realname=claude-code-acp
pkgname=$realname
pkgver=0.12.4
pkgrel=1
pkgdesc="Use Claude Code from any ACP client such as Zed!"
arch=('x86_64')
url="https://github.com/$org/$realname"
license=('Apache-2.0')
makedepends=('npm')
depends=('nodejs')
source=("https://registry.npmjs.org/@$org/$realname/-/$realname-$pkgver.tgz")
sha256sums=('83e4b4f8a027afd265d4033cc482095c9fd04b566188f5c7c1e065fbef663e10')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${realname}-${pkgver}.tgz"
}

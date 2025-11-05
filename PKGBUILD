#!/usr/bin/env bash
# shellcheck disable=SC2034
# Maintainer:  Chmouel Boudjnah <chmouel@chmouel.com>
org=zed-industries
realname=claude-code-acp
pkgname=$realname
pkgver=0.10.0
pkgrel=1
pkgdesc="Use Claude Code from any ACP client such as Zed!"
arch=('x86_64')
url="https://github.com/$org/$realname"
license=('Apache-2.0')
makedepends=('npm')
depends=('nodejs')
source=("https://registry.npmjs.org/@$org/$realname/-/$realname-$pkgver.tgz")
sha256sums=('20b3b3525bcd47b8a2e3b4ed35b0a7dcc4e6b6dfdf7de4ac84ca02fc2a482c5c')

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${realname}-${pkgver}.tgz"
}

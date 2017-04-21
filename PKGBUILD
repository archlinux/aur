# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=mastodon-docker-git
pkgver=1.2.2_22_ga0ed88a9
_branch=master
pkgrel=0.1
pkgdesc="A GNU Social-compatible microblogging server"
arch=('i686' 'x86_64')
url="https://mastodon.social"
license=('AGPL-3.0')
provides=("${pkgname%-docker-git}")
conflicts=("${pkgname%-docker-git}" "${pkgname%-docker-git}-git" "${pkgname%-git}")
source=("git://github.com/tootsuite/${pkgname%-docker-git}.git#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-docker-git}"
  git describe --long --tags | sed 's/^v//;s/-/_/g'
}


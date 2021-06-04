# Maintainer: Amrit Ghimire <iamritghimire@gmail.com>
pkgname=jira-terminal-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="This is a command line application that can be used as a personal productivity tool for interacting with JIRA"
url="https://github.com/amritghimire/jira-terminal"
license=("AGPL-3.0-only")
arch=("x86_64")
provides=("jira-terminal")
source=("https://github.com/amritghimire/jira-terminal/releases/download/v$pkgver/jira-terminal-$pkgver-x86_64.tar.gz")
sha256sums=("3fb344c6b95f55debd0c028e3fea3316c2d416cc8a42d6bb3a353c8b569aae19")

package() {
    install -Dm755 jira-terminal -t "$pkgdir/usr/bin/"
}

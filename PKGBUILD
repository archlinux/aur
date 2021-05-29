# Maintainer: Amrit Ghimire <iamritghimire@gmail.com>
pkgname=jira-terminal-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="This is a command line application that can be used as a personal productivity tool for interacting with JIRA"
url="https://github.com/amritghimire/jira-terminal"
license=("AGPL-3.0-only")
arch=("x86_64")
provides=("jira-terminal")
source=("https://github.com/amritghimire/jira-terminal/releases/download/v$pkgver/jira-terminal-$pkgver-x86_64.tar.gz")
sha256sums=("1f3756c30ac45eaae4d8ca253f5c87166e6dcc5e8f6e62cfcf70ac6858774a80")

package() {
    install -Dm755 jira-terminal -t "$pkgdir/usr/bin/"
}

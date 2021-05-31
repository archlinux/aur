# Maintainer: Amrit Ghimire <iamritghimire@gmail.com>
pkgname=jira-terminal-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="This is a command line application that can be used as a personal productivity tool for interacting with JIRA"
url="https://github.com/amritghimire/jira-terminal"
license=("AGPL-3.0-only")
arch=("x86_64")
provides=("jira-terminal")
source=("https://github.com/amritghimire/jira-terminal/releases/download/v$pkgver/jira-terminal-$pkgver-x86_64.tar.gz")
sha256sums=("2e0552b3c22d97e466a81794c58a472791d0f040bb9066599653d6cc6d245efb")

package() {
    install -Dm755 jira-terminal -t "$pkgdir/usr/bin/"
}

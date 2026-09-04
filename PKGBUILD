# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=tsql-bin
_pkgname="${pkgname%-bin}"
pkgver=0.7.0
pkgrel=1
pkgdesc='A modern PostgreSQL and MongoDB manager TUI - Binary build'
arch=('x86_64')
url='https://github.com/fcoury/tsql'
license=('MIT')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/fcoury/tsql/releases/download/v$pkgver/tsql-x86_64-unknown-linux-gnu.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/fcoury/tsql/refs/tags/v$pkgver/LICENSE")
provides=('tsql')
conflicts=($_pkgname 'tsql-git')

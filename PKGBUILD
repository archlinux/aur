#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=ttdebug
pkgver=0.3.7
pkgrel=1
pkgdesc="Debug tool for Task Type (TT) CPU Scheduler for linux."
url="https://github.com/hamadmarri/TT-CPU-Scheduler"
license=("unknown")
depends=('bash')
arch=('i686' 'x86_64')
source=(
    "https://github.com/hamadmarri/TT-CPU-Scheduler/archive/refs/tags/0.3.7.tar.gz"
)
b2sums=('14e31c8e397a6205bc490dd74c3f94d8ec2203ae512ccef038732a95c7c1be36768022b2912ba414daa7bf87954b79c066a23989f857a8386809e586cc6ea2bb')

package() {
    cd "TT-CPU-Scheduler-$pkgver" || exit
    cp ttdebug.sh ttdebug
    install -Dm755 -t $pkgdir/usr/bin ttdebug
}

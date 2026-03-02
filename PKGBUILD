# Maintainer: OxoGhost <contact@fastq.dev>
pkgname=fastq-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="High-performance Redis-backed job queue written in C (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/OxoGhost01/FastQ"
license=('custom:PolyForm-Noncommercial-1.0.0')
depends=('hiredis' 'json-c' 'openssl')
provides=('fastq')
conflicts=('fastq')

source_x86_64=("fastq-v${pkgver}-linux-x86_64.tar.gz::https://github.com/OxoGhost01/FastQ/releases/download/v${pkgver}/fastq-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("fastq-v${pkgver}-linux-arm64.tar.gz::https://github.com/OxoGhost01/FastQ/releases/download/v${pkgver}/fastq-v${pkgver}-linux-arm64.tar.gz")

sha256sums_x86_64=('32b5289875c1c636e2561a64967aa8e6035de8e0cf4085414596d4aef2b4cd50')
sha256sums_aarch64=('b9f83b0795dfa92ddb7eb211fa7a89d331d868b39d90aefb51151e28276f111d')

package() {
    install -Dm755 fastq "$pkgdir/usr/bin/fastq"
}

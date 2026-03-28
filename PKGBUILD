# Maintainer: cbxcvl <cbxcvl@github>
pkgname=btk-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Burp Token Killer — token-efficient MCP proxy between Claude Code and Burp Suite"
arch=('x86_64' 'aarch64')
url="https://github.com/cbxcvl/BTK"
license=('MIT')
provides=('btk')
conflicts=('btk')

source_x86_64=("btk-linux-x86_64::${url}/releases/download/v${pkgver}/btk-linux-x86_64")
source_aarch64=("btk-linux-aarch64::${url}/releases/download/v${pkgver}/btk-linux-aarch64")

sha256sums_x86_64=('d53cfe8edcc631cf84be0425b98c25282342a2e9d2ad279d2cbb598dc8356067')
sha256sums_aarch64=('14c19217c568ffd80a16e74ce44cff9eedd63972ae2e165344a6a3a181d61278')

package() {
    install -Dm755 "btk-linux-${CARCH}" "${pkgdir}/usr/bin/btk"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'LICENSE'
MIT License

Copyright (c) 2026 cbxcvl

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
LICENSE
}

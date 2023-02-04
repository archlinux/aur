# Maintainer: Ruben Kharel <kharelruben@gmail.com>

# https://github.com/slithery0/chatgpt-cli/archive/refs/tags/v0.0.1.tar.gz
pkgname=gpt-chatbot-cli
pkgver=r41.1746661
pkgrel=1
pkgdesc='A minimal, bloat free chatgpt cli'

arch=('i686' 'x86_64')
url="https://github.com/slithery0/gpt-chatbot-cli"
depends=("python3" "python-pip")

provides=("gpt-chatbot-cli")
conflicts=("gpt-chatbot-cli")

license=('MIT')
md5sums=('SKIP')

source=("git+https://github.com/slithery0/${pkgname%-git}")

pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
		pip3 install gpt-chatbot-cli
}

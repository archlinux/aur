# Maintainer: Yast <yastcher@gmail.com>
pkgname=tapeback-llm
pkgver=0.8.6
pkgrel=1
pkgdesc="LLM summarization support for tapeback (Anthropic, OpenAI, Gemini, etc.)"
arch=('any')
url="https://github.com/yastcher/tapeback"
license=('Apache-2.0')
depends=('tapeback')
install=tapeback-llm.install

# Meta-package: dependencies installed via .install hook into /opt/tapeback/ venv.

package() {
    install -Dm644 /dev/stdin "$pkgdir/usr/share/doc/$pkgname/README" <<EOF
tapeback-llm: LLM summarization support for tapeback.
Pip dependencies installed into /opt/tapeback/ venv by install hook.
EOF
}

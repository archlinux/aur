pkgname=errbot
pkgver=5.1.1
pkgrel=1
pkgdesc="a chatbot. It allows you to start scripts interactively from your chatrooms for any reason: random humour, chatops, starting a build, monitoring commits, triggering alerts..."
arch=(any)
url="https://github.com/errbotio/errbot"
license=('GPL')
depends=('python-daemonize' 'python-dnspython3' 'python-pygments-markdown-lexer'
	 'python-ansi' 'python-markdown' 'python-yapsy' 'python-colorlogs'
	 'python-pyopenssl' 'python-rocket-errbot' 'python-bottle' 'python-webtest'
	 'python-sleekxmpp')
source=("$pkgname-$pkgver.tar.gz::https://github.com/errbotio/errbot/archive/$pkgver.tar.gz")
sha256sums=('a705c3cd8a200c53e8b7209a471038767b281c496360d7495b5e6fe8747c4c36')

package() {
	cd "$pkgname-$pkgver"
	python3 setup.py install --root="$pkgdir/"
}

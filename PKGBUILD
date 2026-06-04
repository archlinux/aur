# Maintainer: wyf9661 <wyf9661@hotmail.com>
# Contributor: Nous Research <ops@nousresearch.com>

_pkgname=hermes-agent
pkgname=python-${_pkgname}
tag=2026.5.29.2
pkgver=0.15.2
pkgrel=1
pkgdesc="The self-improving AI agent — creates skills from experience, improves them during use, and runs anywhere"
arch=('any')
url="https://github.com/NousResearch/${_pkgname}"
license=('MIT')
depends=('python>=3.11' 'python-dotenv' 'python-prompt_toolkit' 'python-openai' 'python-fire'
          'python-ruamel-yaml' 'python-rich' 'python-pyjwt' 'python-tenacity' 'python-yaml'
          'python-httpx' 'python-requests' 'python-jinja' 'python-pydantic' 'python-psutil')
optdepends=('python-telegram-bot: Telegram messaging support'
            'python-discord: Discord messaging support'
            'python-aiohttp: Async HTTP for messaging/web'
            'python-fastapi: Web API server support'
            'python-uvicorn: ASGI server for FastAPI'
            'python-mcp: Model Context Protocol support'
            'python-anthropic: Anthropic Claude API support'
            'python-faster-whisper: Local voice transcription'
            'python-sounddevice: Audio I/O for voice'
            'python-numpy: Numerical computing for voice/other'
            'python-simple-term-menu: Interactive CLI menu'
            'python-dingtalk-stream: DingTalk integration'
            'python-lark-oapi: Feishu/Lark integration'
            'python-slack-sdk: Slack integration'
            'python-qrcode: QR code generation for auth'
            'python-croniter: Cron scheduling support')
makedepends=('python-installer' 'python-wheel')
source=("${url}/releases/download/v${tag}/hermes_agent-${pkgver}-py3-none-any.whl")
sha256sums=('1484b0bf66d269c8d90336509b41a9c1041fc7e6124f138df71c248a955cdc3b')

package() {
  python -m installer --destdir="${pkgdir}" "hermes_agent-${pkgver}-py3-none-any.whl"
}

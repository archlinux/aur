#!/bin/sh
# 国内版固定走中国大陆 API，不随登录账号或区域标记切换。
export KIMI_CODE_HOME="${KIMI_CODE_HOME:-$HOME/.kimi-code-cn}"
export KIMI_CODE_OAUTH_HOST='https://auth.kimi.com'
export KIMI_CODE_BASE_URL='https://api.kimi.com/coding/v1'
export KIMI_CODE_REGION_MARKER=off
exec '/opt/kimi-code-cn/kimi-code-cn' "$@"

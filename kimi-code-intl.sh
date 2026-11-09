#!/bin/sh
# 国际版固定走全球 API，不随登录账号或区域标记切换。
export KIMI_CODE_HOME="${KIMI_CODE_HOME:-$HOME/.kimi-code-intl}"
export KIMI_CODE_OAUTH_HOST='https://auth.kimi.ai'
export KIMI_CODE_BASE_URL='https://api.kimi.ai/coding/v1'
export KIMI_CODE_REGION_MARKER=off
exec '/opt/kimi-code-intl/kimi-code' "$@"

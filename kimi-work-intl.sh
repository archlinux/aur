#!/bin/sh
# 国际版固定走海外区域，不随登录账号或区域标记切换。
BASE=/opt/kimi-work-intl
export DAIMON_BUNDLE_DIR="${BASE}/resources/daimon-bundle"
export KIMI_BUILTIN_SKILLS_DIR="${BASE}/resources/builtin-skills"
export KIMI_WORK_RESOURCES="${BASE}"
export KIMI_AGENT_REGION=sg
exec /usr/bin/electron43 "${BASE}/app.asar" "$@"

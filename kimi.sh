#!/bin/sh

export DAIMON_BUNDLE_DIR=/usr/lib/kimi/daimon-bundle
export KIMI_BUILTIN_SKILLS_DIR=/usr/lib/kimi/daimon-bundle/app/daimon/assets/builtin-skills

exec /usr/bin/electron41 /usr/lib/kimi/app.asar "$@"

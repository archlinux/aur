#!/bin/sh
# The packaged client resolves resources via process.resourcesPath/resources;
# under the system Electron that is /usr/lib/electron43/resources/resources.
# Point the overridable paths there explicitly and start the app.
RES=/usr/lib/electron43/resources/resources
export DAIMON_BUNDLE_DIR="${RES}/daimon-bundle"
export KIMI_BUILTIN_SKILLS_DIR="${RES}/builtin-skills"
exec /usr/bin/electron43 /usr/lib/kimi/app.asar "$@"

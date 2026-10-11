#!/bin/sh
export SLICK_RESOURCES_PATH=/usr/lib/slick/resources
export SLICK_SLACK_RESOURCES=/usr/lib/slack/resources
exec /usr/bin/_electron_ /usr/lib/slick/resources/app "$@"
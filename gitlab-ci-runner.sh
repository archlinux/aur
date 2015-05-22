#! /usr/bin/env bash

if [ "$(id -nu)" != 'gitlab_ci_runner' ]; then
  sudo -u gitlab_ci_runner -H $0 $*
fi

cd /usr/lib/gitlab-ci-runner

if ! bundle install --deployment >/dev/null 2>/var/log/gitlab-ci-runner/bundler.log; then
  echo 'foo' >&2
  exit 1
fi

case $1 in
  register)
    CI_SERVER_URL=https://ci.example.com REGISTRATION_TOKEN=replaceme bundle exec ./bin/setup
  ;;
  start)
  ;;
  stop)
  ;;
  restart)
  ;;
  *)
    echo "Usage: $0 {start|stop|restart|register}"
    exit 1
  ;;
esac

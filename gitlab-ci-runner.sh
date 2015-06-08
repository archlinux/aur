#! /usr/bin/env bash

# Switch to GitLab user if necessary
if [ "$(id -nu)" != 'gitlab_ci_runner' ]; then
  sudo -u gitlab_ci_runner -H $0 $*
fi

# Change to install directory
cd /usr/lib/gitlab-ci-runner/

# Install a newer JSON gem
sed -e "s#gem 'json', '~> 1.7.7'#gem 'json', '~> 1.8.2'#" -i /usr/lib/gitlab-ci-runner/Gemfile

# Install ruby dependencies, 'cause of changed Gemfile
if ! bundle install --path vendor/bundle --no-deployment >/dev/null 2>/var/log/gitlab-ci-runner/bundler.log; then
  echo 'Installing ruby dependency failed!' >&2
  exit 1
fi

# Parse commandline arguments
case "$1" in
  register)
    # Configure GitLab CI runner
    bundle exec ./bin/setup
  ;;
  start)
    # Start GitLab CI runner
    bundle exec ./bin/runner >>/var/log/gitlab-ci-runner/gitlog.log 2>&1 </dev/null
  ;;
  stop)
    # Check if PID file exists
    if [ ! -e /run/gitlab-ci-runner.pid ]; then
      echo 'PID file does not exists!' >&2
      exit 1
    fi

    # Try to kill runner
    if kill $(</run/gitlab-ci-runner.pid) >/dev/null 2>&1; then
      echo 'Gitlab CI runner stopped.'
    else
      echo 'Stopping failed!' >&2
      exit 1
    fi
  ;;
  restart)
    $0 stop
    $0 start
  ;;
  *)
    echo "Usage: $0 {start|stop|restart|register}"
    exit 1
  ;;
esac

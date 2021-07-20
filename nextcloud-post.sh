#!/bin/bash

set -e

occ upgrade
occ maintenance:update:htaccess

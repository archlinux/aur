#
# SPDX-FileCopyrightText: 2025 Lorenz Steinert <lsteinert+aur@uraziel.de>
#
# SPDX-License-Identifier: 0BSD
#

import os
import sys

import django
from django.conf import settings
from django.test.utils import get_runner

if __name__ == "__main__":
    django.setup()
    TestRunner = get_runner(settings)
    test_runner = TestRunner()
    failures = test_runner.run_tests(["tests"])
    sys.exit(bool(failures))

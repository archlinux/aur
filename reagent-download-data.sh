#!/bin/sh
# AiZynthFinder's data fetcher, from the same venv. ReAgent cannot plan until
# this has run once: it pulls the pretrained USPTO expansion policy, the filter
# policy and the ZINC stock (~760 MB) into the directory given as $1.
exec /opt/reagent/bin/download_public_data "$@"

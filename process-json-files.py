#! /usr/bin/python3

#    Copyright (C) 2020, 2021, 2022, 2023, 2024 grizzlyuser <grizzlyuser@protonmail.com>
#    Based on: https://gitlab.trisquel.org/trisquel/wrapage-helpers/-/blob/81881d89b2bf7d502dd14fcccdb471fec6f6b206/helpers/DATA/firefox/reprocess-search-config.py
#    Below is the notice from the original author:
#
#    Copyright (C) 2020  Ruben Rodriguez <ruben@trisquel.info>
#
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA

import json
import sys
import time
import copy
import argparse
import pathlib
import logging
from collections import namedtuple
from jsonschema import validate

parser = argparse.ArgumentParser()
parser.add_argument(
    'MAIN_PATH',
    type=pathlib.Path,
    help='path to main application source code directory')
parser.add_argument(
    'BRANDING_PATH',
    type=pathlib.Path,
    help='path to branding source code directory')
parser.add_argument(
    '-i',
    '--indent',
    type=int,
    default=2,
    help='indent for pretty printing of output files')
parser.add_argument(
    '-l',
    '--loglevel',
    choices=logging._nameToLevel.keys(),
    default=logging.INFO,
    help='logging level')
arguments = parser.parse_args()

logging.basicConfig(level=arguments.loglevel)
logger = logging.getLogger(str(pathlib.Path(__file__).name))

File = namedtuple('File', ['path', 'content'])


class JsonProcessor:
    @classmethod
    def process(cls):
        parsed_jsons = []
        for json_path in cls.JSON_PATHS:
            logger.info('Reading input: ' + str(json_path) + '...')
            with json_path.open() as file:
                parsed_jsons.append(File(json_path, json.load(file)))

        parsed_schema = None
        if hasattr(cls, "SCHEMA_PATH"):
            logger.info('Reading schema: ' + str(json_path) + '...')
            with cls.SCHEMA_PATH.open() as file:
                parsed_schema = json.load(file)

        processed = cls.process_parsed(parsed_jsons, parsed_schema)
        with processed.path.open('w') as file:
            json.dump(processed.content, file, indent=arguments.indent)
            logger.info('Wrote: ' + str(processed.path))


class RemoteSettings(JsonProcessor):
    DUMPS_PATH_RELATIVE = 'services/settings/dumps'
    DUMPS_PATH_ABSOLUTE = arguments.MAIN_PATH / DUMPS_PATH_RELATIVE

    _WRAPPER_NAME = 'data'
    _LAST_MODIFIED_KEY_NAME = 'last_modified'

    @classmethod
    def get_collection_timestamp(cls, collection):
        return max((record[cls._LAST_MODIFIED_KEY_NAME]
                   for record in collection.content), default=0)

    @classmethod
    def wrap(cls, processed):
        return File(processed.path,
                    {cls._WRAPPER_NAME: processed.content,
                     'timestamp': cls.get_collection_timestamp(processed)})

    @classmethod
    def unwrap(cls, parsed_jsons):
        return [File(json.path, json.content[cls._WRAPPER_NAME])
                for json in parsed_jsons]

    @classmethod
    def should_modify_collection(cls, collection):
        return True

    @classmethod
    def now(cls):
        return int(round(time.time_ns() / 10 ** 6))

    @classmethod
    def process_raw(cls, unwrapped_jsons, parsed_schema):
        timestamps, result = [], []

        for collection in unwrapped_jsons:
            should_modify_collection = cls.should_modify_collection(collection)
            for record in collection.content:
                if should_modify_collection:
                    if cls.should_drop_record(record):
                        continue

                    clone = copy.deepcopy(record)

                    record = cls.process_record(record)

                    if clone != record:
                        timestamp = cls.now()
                        while timestamp in timestamps:
                            timestamp += 1
                        timestamps.append(timestamp)
                        record[cls._LAST_MODIFIED_KEY_NAME] = timestamp

                if parsed_schema is not None:
                    validate(record, schema=parsed_schema)

                result.append(record)

        result.sort(
            key=lambda record: record[cls._LAST_MODIFIED_KEY_NAME], reverse=True)
        cls.OUTPUT_PATH.parent.mkdir(parents=True, exist_ok=True)

        return File(cls.OUTPUT_PATH, result)

    @classmethod
    def process_parsed(cls, parsed_jsons, parsed_schema):
        return cls.wrap(
            cls.process_raw(
                cls.unwrap(parsed_jsons),
                parsed_schema))


class EmptyRemoteSettings(RemoteSettings):
    @classmethod
    def should_drop_record(cls, search_engine):
        return True

    @classmethod
    def process_record(cls, record):
        return record


class Changes(RemoteSettings):
    JSON_PATHS = tuple(RemoteSettings.DUMPS_PATH_ABSOLUTE.glob('*/*.json'))
    OUTPUT_PATH = RemoteSettings.DUMPS_PATH_ABSOLUTE / 'monitor/changes'

    @classmethod
    def wrap(cls, processed):
        return File(
            processed.path, {
                'changes': processed.content, 'timestamp': cls.now()})

    @classmethod
    def process_raw(cls, unwrapped_jsons, parsed_schema):
        changes = []

        for collection in unwrapped_jsons:
            if collection.path != RemoteSettings.DUMPS_PATH_ABSOLUTE / 'main/example.json':
                latest_change = {}
                latest_change[cls._LAST_MODIFIED_KEY_NAME] = cls.get_collection_timestamp(
                    collection)
                latest_change['bucket'] = collection.path.parent.name
                latest_change['collection'] = collection.path.stem
                changes.append(latest_change)

        cls.OUTPUT_PATH.parent.mkdir(parents=True, exist_ok=True)

        return File(cls.OUTPUT_PATH, changes)


class SearchConfigV2(RemoteSettings):
    JSON_PATHS = (
        RemoteSettings.DUMPS_PATH_ABSOLUTE /
        'main/search-config-v2.json',
    )
    SCHEMA_PATH = arguments.MAIN_PATH / \
        'toolkit/components/search/schema/search-config-v2-schema.json'
    OUTPUT_PATH = JSON_PATHS[0]

    _DUCKDUCKGO_SEARCH_ENGINE_IDENTIFIER = 'ddg'

    @classmethod
    def should_drop_record(cls, record):
        if record['recordType'] != 'engine':
            return False
        identifier = record['identifier']
        return identifier != cls._DUCKDUCKGO_SEARCH_ENGINE_IDENTIFIER and not identifier.startswith(
            'wikipedia')

    @classmethod
    def process_record(cls, record):
        match record['recordType']:
            case 'defaultEngines':
                return cls.process_default_engines(record)
            case  'engine':
                return cls.process_engine(record)
            case 'engineOrders':
                return cls.process_engine_orders(record)
            case _:
                return record

    @classmethod
    def process_default_engines(cls, default_engines):
        default_engines['globalDefault'] = cls._DUCKDUCKGO_SEARCH_ENGINE_IDENTIFIER
        default_engines['specificDefaults'] = []
        return default_engines

    @classmethod
    def process_engine(cls, engine):
        engine['base'].pop('partnerCode', None)
        engine['base']['urls']['search'].pop('params', None)

        if engine['identifier'] == cls._DUCKDUCKGO_SEARCH_ENGINE_IDENTIFIER:
            engine['base']['name'] += ' HTML'
            engine['base']['urls']['search']['base'] = 'https://html.duckduckgo.com/html'
            engine['variants'] = [
                {'environment': {'allRegionsAndLocales': True}}]

        return engine

    @classmethod
    def process_engine_orders(cls, engine_orders):
        engine_orders['orders'] = []
        return engine_orders


class SearchConfigOverridesV2(EmptyRemoteSettings):
    JSON_PATHS = (
        RemoteSettings.DUMPS_PATH_ABSOLUTE /
        'main/search-config-overrides-v2.json',
    )
    SCHEMA_PATH = arguments.MAIN_PATH / \
        'toolkit/components/search/schema/search-config-overrides-v2-schema.json'
    OUTPUT_PATH = JSON_PATHS[0]


class SearchDefaultOverrideAllowlist(EmptyRemoteSettings):
    JSON_PATHS = (
        RemoteSettings.DUMPS_PATH_ABSOLUTE /
        'main/search-default-override-allowlist.json',
    )
    SCHEMA_PATH = arguments.MAIN_PATH / \
        'toolkit/components/search/schema/search-default-override-allowlist-schema.json'
    OUTPUT_PATH = JSON_PATHS[0]


class SearchTelemetryV2(EmptyRemoteSettings):
    JSON_PATHS = (
        RemoteSettings.DUMPS_PATH_ABSOLUTE /
        'main/search-telemetry-v2.json',
    )
    SCHEMA_PATH = arguments.MAIN_PATH / \
        'browser/components/search/schema/search-telemetry-v2-schema.json'
    OUTPUT_PATH = JSON_PATHS[0]


class TranslationsModels(EmptyRemoteSettings):
    JSON_PATHS = (
        RemoteSettings.DUMPS_PATH_ABSOLUTE /
        'main/translations-models.json',
    )
    OUTPUT_PATH = JSON_PATHS[0]


class TranslationsWasm(EmptyRemoteSettings):
    JSON_PATHS = (
        RemoteSettings.DUMPS_PATH_ABSOLUTE /
        'main/translations-wasm.json',
    )
    OUTPUT_PATH = JSON_PATHS[0]


class UrlClassifierSkipUrls(EmptyRemoteSettings):
    JSON_PATHS = (
        RemoteSettings.DUMPS_PATH_ABSOLUTE /
        'main/url-classifier-skip-urls.json',
    )
    OUTPUT_PATH = JSON_PATHS[0]


class TippyTopSites(JsonProcessor):
    JSON_PATHS = (
        arguments.MAIN_PATH /
        'browser/components/topsites/content/tippytop/top_sites.json',
        arguments.BRANDING_PATH /
        'tippytop/top_sites.json')

    @classmethod
    def process_parsed(cls, parsed_jsons, parsed_schema):
        tippy_top_sites_main = parsed_jsons[0]
        tippy_top_sites_branding = parsed_jsons[1]
        result = tippy_top_sites_branding.content + \
            [site for site in tippy_top_sites_main.content if 'wikipedia.org' in site['domains']]
        return File(tippy_top_sites_main.path, result)


class TopSites(RemoteSettings):
    _TOP_SITES_JSON_PATH = 'main/top-sites.json'
    _TOP_SITES_PATH_MAIN = RemoteSettings.DUMPS_PATH_ABSOLUTE / _TOP_SITES_JSON_PATH

    JSON_PATHS = (
        arguments.BRANDING_PATH /
        RemoteSettings.DUMPS_PATH_RELATIVE /
        _TOP_SITES_JSON_PATH,
        _TOP_SITES_PATH_MAIN)
    OUTPUT_PATH = _TOP_SITES_PATH_MAIN

    @classmethod
    def should_modify_collection(cls, collection):
        return cls._TOP_SITES_PATH_MAIN == collection.path

    @classmethod
    def should_drop_record(cls, site):
        return site['url'] != 'https://www.wikipedia.org/'

    @classmethod
    def process_record(cls, site):
        site.pop('exclude_regions', None)
        return site


# To reflect the latest timestamps, Changes class should always come after
# all other RemoteSettings subclasses
processors = (
    SearchConfigOverridesV2,
    SearchConfigV2,
    SearchDefaultOverrideAllowlist,
    SearchTelemetryV2,
    TippyTopSites,
    TopSites,
    TranslationsModels,
    TranslationsWasm,
    UrlClassifierSkipUrls,
    Changes)

for processor in processors:
    processor.process()

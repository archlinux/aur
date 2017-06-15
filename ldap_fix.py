# GNU MediaGoblin -- federated, autonomous media hosting
# Copyright (C) 2011, 2012 MediaGoblin contributors.  See AUTHORS.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
from ldap3 import Server, Connection, SUBTREE
from ldap3.core.exceptions import LDAPException
import logging

import six

from mediagoblin.tools import pluginapi

_log = logging.getLogger(__name__)


class LDAP(object):
    def __init__(self):
        self.ldap_settings = pluginapi.get_config('mediagoblin.plugins.ldap')

    def _connect(self, server):
        _log.info('Connecting to {0}.'.format(server['LDAP_SERVER_URI']))
        self.server = Server(server['LDAP_SERVER_URI'])

        if 'LDAP_START_TLS' in server and server['LDAP_START_TLS'] == 'true':
            _log.info('Initiating TLS')
            self.server.start_tls()

    def _manager_auth(self, settings, username, password):
        conn = Connection(self.server,
                settings['LDAP_BIND_DN'],
                settings['LDAP_BIND_PW'],
                auto_bind=True)
        found = conn.search(
                search_base=settings['LDAP_SEARCH_BASE'],
                search_filter=settings['LDAP_SEARCH_FILTER'].format(username=username),
                search_scope=SUBTREE,
                attributes=[settings['EMAIL_SEARCH_FIELD']])
        if (not found) or len(conn.entries) > 1:
            return False, None

        user = conn.entries[0]
        user_dn = user.entry_dn
        try:
            email = user.entry_attributes_as_dict[settings['EMAIL_SEARCH_FIELD']][0]
        except KeyError:
            email = None

        Connection(self.server, user_dn, password, auto_bind=True)

        return username, email

    def _direct_auth(self, settings, username, password):
        user_dn = settings['LDAP_USER_DN_TEMPLATE'].format(username=username)
        conn = Connection(self.server, user_dn, password, auto_bind=True)
        email_found = conn.search(
                search_base=settings['LDAP_SEARCH_BASE'],
                search_filter='uid={0}'.format(username),
                search_scope=SUBTREE,
                attributes=[settings['EMAIL_SEARCH_FIELD']])

        if email_found:
            try:
                email = conn.entries[0].entry_attributes_as_dict[settings['EMAIL_SEARCH_FIELD']][0]
            except KeyError:
                email = None

        return username, email

    def login(self, username, password):
        for k, v in six.iteritems(self.ldap_settings):
            try:
                self._connect(v)

                if 'LDAP_BIND_DN' in v:
                    return self._manager_auth(v, username, password)
                else:
                    return self._direct_auth(v, username, password)

            except LDAPException as e:
                _log.info(e)

        return False, None

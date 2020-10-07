#!/bin/sh


java $KC_OPTS -cp /var/lib/kcadm/keycloak-admin-cli-11.0.2.jar org.keycloak.client.admin.cli.KcAdmMain "$@"

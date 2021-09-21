#Display name of the healthchecks instance.
#SITE_NAME="Mychecks"

#Base URL of the healthchecks instance.
#SITE_ROOT="http://localhost:8000"

#Logo URL
#SITE_LOGO_URL=""

#Ping settings.
#PING_EMAIL_DOMAIN="localhost"
#PING_ENDPOINT="<SITE_ROOT/ping/>"

#The label for the "Overall Status" status badge.  Defaults to SITE_NAME.
#MASTER_BADGE_LABEL=<SITE_NAME>

#The host/domains that this site can serve. You can specify multiple domain names by separating them with commas.
#ALLOWED_HOSTS=*

#Allow visitors to create new accounts.  If False, the administrator may still invite selected users.
#REGISTRATION_OPEN=True

#Request header for external authentication.
#REMOTE_USER_HEADER=

#Relying Party Identifier.  Set to your site's domain.  Required by WebAuthn 2fa.
#RP_ID=

#Django cryptographic setting.
#SECRET_KEY=

#Upper limit (in bytes) of logged ping request bodies.
#PING_BODY_LIMIT=10000

#Turn billing features on/off.
#USE_PAYMENTS=False

#Email settings.
#DEFAULT_FROM_EMAIL="noreply@my-monitoring-project.com"
#SERVER_EMAIL="noreply@my-monitoring-admin.com"
#SUPPORT_EMAIL = "pleasereply@my-monitoring-support.com"
#EMAIL_HOST="your-smtp-server-here.com"
#EMAIL_PORT=587
#EMAIL_HOST_USER="username"
#EMAIL_HOST_PASSWORD="password"
#EMAIL_USE_TLS=True

#Send a verification email when adding an email integration.
#EMAIL_USE_VERIFICATION=True

#The database engine to use. Possible values: sqlite, postgres, mysql.
#DB="sqlite"

#Database settings.
#DB_CONN_MAX_AGE=0
#DB_HOST=""
#DB_PORT=""
#DB_USER=""
#DB_PASSWORD=""

#Set this to hc (or your database name, if something different) for PostgreSQL or MySQL.
#DB_NAME="/usr/share/webapps/healthchecks/hc.sqlite"

#Postgres DB settings
#DB_SSLMODE="prefer"
#DB_TARGET_SESSION_ATTRS="read-write"

#A boolean that turns on/off debug mode.
DEBUG=False

#A boolean that turns on/off the Apprise integration.
#APPRISE_ENABLED=False

#Discord integration.
#DISCORD_CLIENT_ID=
#DISCORD_CLIENT_SECRET=

#No clue what these are.
#LINENOTIFY_CLIENT_ID=
#LINENOTIFY_CLIENT_SECRET=

#Matrix integration.
#MATRIX_ACCESS_TOKEN=
#MATRIX_HOMESERVER=
#MATRIX_USER_ID=

#Mattermost integration.
#MATTERMOST_ENABLED=True

#Microsoft Teams integration.
#MSTEAMS_ENABLED=True

#Opsgenie integration.
#OPSGENIE_ENABLED=True

#PagerTree integratino.
#PAGERTREE_ENABLED=True

#PagerDuty integration.
#PD_ENABLED=True
#PD_VENDOR_KEY=

#Prometheus integration.
#PROMETHEUS_ENABLED=True

#Pushbullet integration.
#PUSHBULLET_CLIENT_ID=
#PUSHBULLET_CLIENT_SECRET=

#Pushover integration.
#PUSHOVER_API_TOKEN=
#PUSHOVER_EMERGENCY_EXPIRATION=86400
#PUSHOVER_EMERGENCY_RETRY_DELAY=300
#PUSHOVER_SUBSCRIPTION_URL=

#Shell commands integration.
#SHELL_ENABLED=False

#Signal integration.
#SIGNAL_CLI_ENABLED=False

#Slack integration.
#SLACK_CLIENT_ID=
#SLACK_CLIENT_SECRET=
#SLACK_ENABLED=True

#Spike.sh integration.
#SPIKE_ENABLED=True

#Telegram integration.
#TELEGRAM_BOT_NAME="ExampleBot"
#TELEGRAM_TOKEN=

#Trello integration.
#TRELLO_APP_KEY=

#Twilio integration.
#TWILIO_ACCOUNT=
#TWILIO_AUTH=
#TWILIO_FROM=
#TWILIO_USE_WHATSAPP=False

#VictorOps integration.
#VICTOROPS_ENABLED=True

#Webhooks integration.
#WEBHOOKS_ENABLED=True

#Zulip integration.
#ZULIP_ENABLED=True

#
# Parameters to be passed to teamspeak3-server
#
# The following commandline parameters are available:
#
#* default_voice_port (9987)
#  UDP port open for clients to connect to. This port is used by the first 
#  virtual server, subsequently started virtual servers will open on increasing 
#  port numbers.
#  Default: The default voice port is 9987.
#
#* voice_ip (0.0.0.0)
#  IP on which the server instance will listen for incoming voice connections.
#  Default: The server is bound on any IP address.
#
#* create_default_virtualserver (1)
#  Normally one virtual server is created automatically when the TeamSpeak 3
#  Server process is started. To disable this behaviour, set this parameter
#  to "0". In this case you have to start virtual servers manually using the
#  ServerQuery interface.
#  Default: If not provided, one virtual server is created.
#
#* machine_id (<empty>)
#  Optional name of this server process to identify a group of servers with
#  the same ID. This can be useful when running multiple TeamSpeak 3 Server
#  instances on the same database. Please note that we strongly recommend that
#  you do NOT run multiple server instances on the same SQLite database.
#  Default: The server instance will not use a machine ID.
#
#* filetransfer_port (30033)
#  TCP Port opened for file transfers. If you specify this parameter, you also 
#  need to specify the "filetransfer_ip" parameter!
#  Default: The default file tranfer port is 30033.
#  
#* filetransfer_ip (0.0.0.0)
#  IP on which the file transfers are bound to. If you specify this parameter, 
#  you also need to specify the "filetransfer_port" parameter!
#  Default: File transfers are bound on any IP address.
#
#* query_port (10011)
#  TCP Port opened for ServerQuery connections. If you specify this parameter, 
#  need to specify the "query_ip" parameter!
#  Default: The default ServerQuery port is 10011.
#
#* query_ip (0.0.0.0)
#  IP bound for incoming ServerQuery connections. If you specify this parameter, 
#  you also need to specify the "query_port" parameter!
#  Default: ServerQuery connections are bound on any IP address.
#
#* clear_database (0)
#  If set to "1", the server database will be cleared before starting up the server. 
#  This is mainly used for testing. Usually this parameter should not be specified, 
#  so all server settings will be restored when the server process is restarted.
#  Default: Database is not cleared on start.
#
#* logpath (logs/)
#  The physical path where the server will create logfiles.
#  Default: The server will create logfiles in the "logs/" subdirectory.
#
#* dbplugin (ts3db_sqlite3)
#  Name of the database plugin library used by the server instance. For example, if
#  you want to start the server with MySQL support, simply set this parameter to
#  "ts3db_mysql" to use the MySQL plugin. Do *NOT* specify the "lib" prefix or the file 
#  extension of the plugin.
#  Default: The default SQLite3 database plugin will be used.
#  
#* dbpluginparameter (<empty>)
#  A custom parameter passed to the database plugin library. For example, the MySQL
#  database plugin supports a parameter to specify the physical path of the plugins
#  configuration file.
#  Default: The database plugin will be used without a parameter.
#
#* dbsqlpath (sql/)
#  The physical path where your SQL script files are located.
#  Default: The server will search for SQL script files in the "sql/" subdirectory.
#
#* dbsqlcreatepath (create_sqlite/)
#  The physical path where your SQL installation files are located. Note that this 
#  path will be added to the value of the "dbsqlpath" parameter.
#  Default: The server will search for SQL installation scripts files in the 
#  "<dbsqlpath>/dbsqlcreatepath/" subdirectory.
#  
#* licensepath (<empty>)
#  The physical path where your license file is located.
#  Default: The license file is located in your servers installation directory.
#  
#* createinifile (0)
#  If set to "1", the server will create an INI-style config file containing all 
#  commandline parameters with the values you have specified.
#  Default: The server will not create a config file.
#  
#* inifile (ts3server.ini)
#  The physical path where your config file is located. Per default, the config file will
#  be called "ts3server.ini".
#  Default: The config file is located in your servers installation directory.
#  
#* query_ip_whitelist (query_ip_whitelist.txt)
#  The file containing whitelisted IP addresses for the ServerQuery interface. All hosts
#  listed in this file will be ignored by the ServerQuery flood protection.
#  Default: The whitelist file is located in your servers installation directory.
#  
#* query_ip_backlist (query_ip_backlist.txt)
#  The file containing backlisted IP addresses for the ServerQuery interface. All hosts
#  listed in this file are not allowed to connect to the ServerQuery interface.
#  Default: The whitelist file is located in your servers installation directory.
#
#* dbclientkeepdays (90)
#  Defines how many days to keep unused client identities. Auto-pruning is triggered on every 
#  start and on every new month while the server is running.
#  Default: The server will auto-prune client identities older than 90 days.
#  
#* dblogkeepdays (90)
#  Defines how many days to keep database log entries. Auto-pruning is triggered on every 
#  start and on every new month while the server is running.
#  Default: The server will auto-prune log entries older than 90 days.
#  
#* logquerycommands (1)
#  If set to "1", the server will log every ServerQuery command executed by clients. This can
#  be useful while trying to diagnose several different issues.
#  Default: ServerQuery commands will not be logged.
#  
#* no_permission_update (0)
#  If set to "1", new permissions will not be added to existing groups automatically. Note that
#  this can break your server configuration if you dont update them manually.
#  Default: New permissions will be added to existing groups automatically.

TS_ARGS="logpath=/var/log/teamspeak3-server/ dbsqlpath=/usr/share/teamspeak3-server/sql/"


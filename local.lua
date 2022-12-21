-- use this file for local configuration
snort =
{
    ['-Q'] = true, -- inline mode
}

daq =
{
    modules =
    {
        {
            name = 'nfq',
            mode = 'inline',
        },
    },
    module_dirs =
    {
        '/usr/lib/daq',
    },
}

reputation =
{
    blocklist = BLACK_LIST_PATH .. '/default.blocklist',
    allowlist = WHITE_LIST_PATH .. '/default.allowlist',
    priority = allowlist,
    allow = do_not_block,
}

ips =
{
    mode = inline,

    -- disable rules which cause excessive logging
    --states = [[
    --    alert ( gid:116; sid: 150; enable:no; )
    --    alert ( gid:116; sid: 151; enable:no; )
    --]],

    -- use this to enable decoder and inspector alerts
    --enable_builtin_rules = true,

    -- use include for rules files; be sure to set your path
    -- note that rules files can include other rules files
    include = RULE_PATH .. '/snort.rules',

    variables = default_variables,

    -- pulledpork normally includes local.rules in snort.rules
    -- otherwise you may add line to include local.rules too
    --rules = [[
    --    include $RULE_PATH/local.rules
    --]]
}

normalizer =
{
    tcp =
    {
        ips = true,
    }
}

file_policy =
{
    enable_type = true,
    enable_signature = true,
    rules = { use = { verdict = 'log', enable_file_type = true, enable_file_signature = true } }
}

-- Enable hyperscan for IPS, AppID, HTTP inspection, pcre/regex matches
search_engine = { search_method = "hyperscan" }
detection = { hyperscan_literals = true, pcre_to_regex = true }

-- Enable ZIP, PDF and SWF decompression in http_inspect and smtp
--http_inspect.decompress_pdf = true
--http_inspect.decompress_swf = true
--http_inspect.decompress_zip = true
--smtp.decompress_pdf = true
--smtp.decompress_swf = true
--smtp.decompress_zip = true

-- Logging

-- Enable logging of email headers and attachments in smtp
--smtp.log_email_hdrs = true
--smtp.log_filename = true
--smtp.log_mailfrom = true
--smtp.log_rcptto = true

unified2 =
{
    limit = 128,
}

alert_fast =
{
    file = true,
    packet = false,
    limit = 128,
}

file_log =
{
    log_pkt_time = true,
    log_sys_time = false,
}

alert_json =
{
    file = true,
    limit = 128,
    fields = 'seconds action class b64_data dir dst_addr dst_ap dst_port eth_dst eth_len eth_src eth_type gid icmp_code icmp_id icmp_seq icmp_type iface ip_id ip_len msg mpls pkt_gen pkt_len pkt_num priority proto rev rule service sid src_addr src_ap src_port target tcp_ack tcp_flags tcp_len tcp_seq tcp_win tos ttl udp_len vlan timestamp',
}

-- OpenAppID
appid =
{
    app_detector_dir = '/usr/lib/openappid',
    log_stats = true,
    app_stats_period = 60,
}

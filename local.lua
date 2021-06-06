daq =
{
    modules =
    {
        {
            name = 'afpacket',
            mode = 'inline',
        },
    },
    module_dirs =
    {
        '/usr/lib/daq',
    },
}

ips =
{
    mode = inline,

    -- use this to enable decoder and inspector alerts
    --enable_builtin_rules = true,

    -- use include for rules files; be sure to set your path
    -- note that rules files can include other rules files
    --include = 'snort3-community.rules',

    variables = default_variables,

    -- pulledpork normally includes local.rules in snort.rules
    -- otherwise you may add line to include local.rules too
    rules = [[
        include $RULE_PATH/snort.rules
    ]]
}

normalizer =
{
    tcp =
    {
        ips = true,
    }
}

file_id =
{
    enable_type = true,
    enable_signature = true,
    file_rules = file_magic,
    file_policy =
    {
        { use = { verdict = 'log', enable_file_type = true, enable_file_signature = true } }
    }
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
}

file_log =
{
    log_pkt_time = true,
    log_sys_time = false,
}

-- OpenAppID
appid =
{
    app_detector_dir = '/usr/lib/openappid',
    log_stats = true,
    app_stats_period = 60,
}

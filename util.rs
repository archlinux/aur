use chrono::{DateTime, Datelike, Utc};
use crate::model::FileStats;

pub fn week_key(timestamp: &DateTime<Utc>) -> String {
    format!("{}-W{:02}", timestamp.year(), timestamp.iso_week().week())
}

pub fn files_matching<'a>(
    files: &'a [FileStats],
    path_prefix: Option<&'a str>,
) -> impl Iterator<Item = &'a FileStats> + 'a {
    files.iter().filter(move |fs| {
        if let Some(prefix) = path_prefix {
            fs.path.starts_with(prefix)
        } else {
            true
        }
    })
}

use async_io::Timer;
use atspi::proxy::accessible::{AccessibleProxy, ObjectRefExt};
use atspi::proxy::bus::BusProxy;
use atspi::proxy::proxy_ext::ProxyExt;
use atspi::zbus::proxy::CacheProperties;
use atspi::zbus::{Address, Connection};
use atspi::{ObjectRefOwned, State};
use futures_lite::future::{self, block_on};
use std::future::Future;
use std::sync::{LazyLock, Mutex, OnceLock};
use std::time::Duration;

const CONNECTION_TIMEOUT: Duration = Duration::from_millis(250);
const METHOD_TIMEOUT: Duration = Duration::from_millis(75);
const OPERATION_TIMEOUT: Duration = Duration::from_millis(200);

static CONNECTION: OnceLock<Connection> = OnceLock::new();
static OPERATION_LOCK: LazyLock<Mutex<()>> = LazyLock::new(|| Mutex::new(()));

pub enum EditKind<'a> {
    Insert(&'a str),
    DeleteBackward(i32),
}

fn connection() -> Option<&'static Connection> {
    if let Some(connection) = CONNECTION.get() {
        return Some(connection);
    }
    let connection = block_on(with_timeout(CONNECTION_TIMEOUT, open_connection())).flatten()?;
    let _ = CONNECTION.set(connection);
    CONNECTION.get()
}

async fn open_connection() -> Option<Connection> {
    let session = Connection::session().await.ok()?;
    let address: Address = BusProxy::new(&session)
        .await
        .ok()?
        .get_address()
        .await
        .ok()?
        .parse()
        .ok()?;
    atspi::zbus::connection::Builder::address(address)
        .ok()?
        .method_timeout(METHOD_TIMEOUT)
        .build()
        .await
        .ok()
}

async fn with_timeout<T>(timeout: Duration, operation: impl Future<Output = T>) -> Option<T> {
    future::or(async { Some(operation.await) }, async {
        Timer::after(timeout).await;
        None
    })
    .await
}

async fn traversal_roots(connection: &Connection) -> Option<(Vec<ObjectRefOwned>, bool)> {
    let registry = AccessibleProxy::builder(connection)
        .destination("org.a11y.atspi.Registry")
        .ok()?
        .path("/org/a11y/atspi/accessible/root")
        .ok()?
        .cache_properties(CacheProperties::No)
        .build()
        .await
        .ok()?;
    let applications = registry.get_children().await.ok()?;
    for application in &applications {
        let Ok(application) = application.as_accessible_proxy(connection).await else {
            continue;
        };
        let Ok(windows) = application.get_children().await else {
            continue;
        };
        for window in windows {
            let Ok(proxy) = window.as_accessible_proxy(connection).await else {
                continue;
            };
            if proxy
                .get_state()
                .await
                .is_ok_and(|states| states.contains(State::Active))
            {
                return Some((vec![window], true));
            }
        }
    }
    Some((applications, false))
}

async fn selected_from_roots(
    connection: &Connection,
    roots: Vec<ObjectRefOwned>,
    node_limit: usize,
) -> String {
    let mut stack: Vec<_> = roots
        .into_iter()
        .rev()
        .map(|object| (object, 0usize))
        .collect();
    let mut visited = 0usize;
    while let Some((object, depth)) = stack.pop() {
        if visited >= node_limit {
            break;
        }
        visited += 1;
        let Ok(proxy) = object.as_accessible_proxy(connection).await else {
            continue;
        };
        let focused = proxy
            .get_state()
            .await
            .is_ok_and(|states| states.contains(State::Focused));
        if focused
            && let Ok(proxies) = proxy.proxies().await
            && let Ok(text) = proxies.text().await
        {
            let selections = text.get_n_selections().await.unwrap_or(0);
            if selections > 0
                && let Ok((start, end)) = text.get_selection(0).await
                && end > start
            {
                return text.get_text(start, end).await.unwrap_or_default();
            }
            // A focused Text object with no selection is a valid result.
            return String::new();
        }
        if depth < 32
            && let Ok(children) = proxy.get_children().await
        {
            stack.extend(children.into_iter().rev().map(|child| (child, depth + 1)));
        }
    }
    String::new()
}

async fn edit_from_roots(
    connection: &Connection,
    roots: Vec<ObjectRefOwned>,
    node_limit: usize,
    kind: &EditKind<'_>,
) -> bool {
    let mut stack: Vec<_> = roots
        .into_iter()
        .rev()
        .map(|object| (object, 0usize))
        .collect();
    let mut visited = 0usize;
    while let Some((object, depth)) = stack.pop() {
        if visited >= node_limit {
            break;
        }
        visited += 1;
        let Ok(proxy) = object.as_accessible_proxy(connection).await else {
            continue;
        };
        let focused = proxy
            .get_state()
            .await
            .is_ok_and(|states| states.contains(State::Focused));
        if focused
            && let Ok(proxies) = proxy.proxies().await
            && let (Ok(text), Ok(editable)) = (proxies.text().await, proxies.editable_text().await)
        {
            let Ok(caret) = text.caret_offset().await else {
                return false;
            };
            if caret < 0 {
                return false;
            }
            return match kind {
                EditKind::Insert(value) => match i32::try_from(value.len()) {
                    Ok(length) => editable
                        .insert_text(caret, value, length)
                        .await
                        .unwrap_or(false),
                    Err(_) => false,
                },
                EditKind::DeleteBackward(count) => {
                    let start = caret.saturating_sub((*count).max(0)).max(0);
                    start == caret || editable.delete_text(start, caret).await.unwrap_or(false)
                }
            };
        }
        if depth < 32
            && let Ok(children) = proxy.get_children().await
        {
            stack.extend(children.into_iter().rev().map(|child| (child, depth + 1)));
        }
    }
    false
}

pub fn get_selected_text() -> String {
    let _guard = OPERATION_LOCK
        .lock()
        .unwrap_or_else(|poisoned| poisoned.into_inner());
    let Some(connection) = connection() else {
        return String::new();
    };
    block_on(with_timeout(OPERATION_TIMEOUT, async {
        let Some((roots, active_window)) = traversal_roots(connection).await else {
            return String::new();
        };
        selected_from_roots(connection, roots, if active_window { 2048 } else { 512 }).await
    }))
    .unwrap_or_default()
}

pub fn edit_focused_text(kind: EditKind<'_>) -> bool {
    let _guard = OPERATION_LOCK
        .lock()
        .unwrap_or_else(|poisoned| poisoned.into_inner());
    let Some(connection) = connection() else {
        return false;
    };
    block_on(with_timeout(OPERATION_TIMEOUT, async {
        let Some((roots, active_window)) = traversal_roots(connection).await else {
            return false;
        };
        edit_from_roots(
            connection,
            roots,
            if active_window { 2048 } else { 512 },
            &kind,
        )
        .await
    }))
    .unwrap_or(false)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn timeout_cancels_a_pending_operation() {
        let started = std::time::Instant::now();
        let result = block_on(with_timeout(
            Duration::from_millis(10),
            future::pending::<()>(),
        ));
        assert_eq!(result, None);
        assert!(started.elapsed() < Duration::from_secs(1));
    }
}

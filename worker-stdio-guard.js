/*
 * Linux port: worker stdio guard.
 *
 * xTool Studio forks its service workers (discover-worker, usb-detect-worker)
 * with piped stdio (`child_process.fork(..., { silent: true })`). When the
 * reading end of that pipe is gone, every write fails with EPIPE. Node's console
 * implementation re-throws that error from its write callback, which lands in the
 * worker's own `uncaughtException` handler -- and that handler logs via
 * console.error, so it throws again: an endless, process-killing loop.
 *
 * Logging must never take a worker down, so this guard makes every console and
 * stdio write EPIPE-tolerant. It is prepended verbatim to the generated worker
 * bundles by build.sh; the rest of the app is untouched.
 */
;(function () {
	const isBrokenPipe = (e) => !!e && (e.code === 'EPIPE' || e.code === 'ERR_STREAM_DESTROYED')

	for (const stream of [process.stdout, process.stderr]) {
		if (!stream) continue
		stream.on('error', (e) => {
			if (!isBrokenPipe(e)) throw e
		})
		const write = stream.write.bind(stream)
		stream.write = (...args) => {
			try {
				return write(...args)
			} catch (e) {
				if (isBrokenPipe(e)) return true
				throw e
			}
		}
	}

	for (const method of ['log', 'info', 'warn', 'error', 'debug', 'trace']) {
		const original = console[method].bind(console)
		console[method] = (...args) => {
			try {
				original(...args)
			} catch (e) {
				if (!isBrokenPipe(e)) throw e
			}
		}
	}
})()

'use strict';

// Linux stub for gamebryo-plugin-management.
// The real extension requires LOOT (Windows-only binary) for plugin sorting.
// This stub registers the same Redux state paths and API surface so that
// dependent extensions (gamebryo-archive-check, gamebryo-plugin-indexlock,
// and user-installed mods) can load without errors.

function main(context) {
  // Redux state: same paths and defaults as the real extension.
  // getSafe() calls in dependent plugins will find these instead of undefined.
  context.registerReducer(['session', 'plugins'], {
    reducers: {},
    defaults: { pluginList: {}, pluginInfo: {}, newlyAddedPlugins: 0 },
  });
  context.registerReducer(['loadOrder'], {
    reducers: {},
    defaults: {},
  });
  context.registerReducer(['userlist'], {
    reducers: {},
    defaults: { plugins: [], groups: [] },
  });
  context.registerReducer(['masterlist'], {
    reducers: {},
    defaults: {},
  });
  context.registerReducer(['settings', 'plugins'], {
    reducers: {},
    defaults: { autoSort: true, autoEnable: false },
  });

  // Public APIs: no-ops so callers don't crash.
  context.registerAPI('lootSortAsync', (sortCall) => {
    if (sortCall && typeof sortCall.onSortCallback === 'function') {
      sortCall.onSortCallback(new Error('LOOT not available on Linux'), []);
    }
  }, { minArguments: 1 });

  context.registerAPI('isBlueprintPlugin', () => false, { minArguments: 1 });

  return true;
}

module.exports = { default: main };

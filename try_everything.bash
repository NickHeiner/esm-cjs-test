#! /usr/bin/env bash

set -x

echo "=== Expected to fail because the requesting file is invalid ==="
set +e
node classic-package/esm.js
node module-package/vanilla.js
set -e

echo "=== Should work ==="
node classic-package/vanilla.js
node classic-package/vanilla.cjs
node module-package/esm.js
node module-package/vanilla.cjs
node -e 'console.log(require("ai-jsx"))'

rm -rf */dist

echo "=== Expected to fail ==="
set +e
npx tsc -p classic-package/tsconfig-output-to-esm.json
npx tsc -p classic-package/tsconfig-output-to-cjs.json
set -e

echo "=== Should work ==="
npx tsc -p module-package/tsconfig-output-to-esm.json
npx tsc -p module-package/tsconfig-output-to-cjs.json

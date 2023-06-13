#! /usr/bin/env bash

set +e -x

echo "=== Expected to fail because the requesting file is invalid ==="
node classic-package/esm.js
node module-package/vanilla.js

echo "=== Should work ==="
node classic-package/vanilla.js
node classic-package/vanilla.cjs
node module-package/esm.js
node module-package/vanilla.cjs

rm -rf dist

echo "=== Expected to fail ==="
npx tsc -p classic-package/tsconfig-output-to-esm.json
npx tsc -p classic-package/tsconfig-output-to-cjs.json

echo "=== Should work ==="
npx tsc -p module-package/tsconfig-output-to-esm.json
npx tsc -p module-package/tsconfig-output-to-cjs.json

node dist/cjs/classic-package/index.js
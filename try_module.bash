#! /usr/bin/env bash

set +e -x

echo "=== Expected to fail because the requesting file is invalid ==="
node module-package/vanilla.js

echo "=== Should work ==="
node module-package/esm.js
node module-package/vanilla.cjs

rm -rf dist

echo "=== Should work ==="
npx tsc -p module-package/tsconfig-output-to-esm.json
npx tsc -p module-package/tsconfig-output-to-cjs.json

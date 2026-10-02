const { verifyConditions, prepare } = require('@json-schema-tools/semantic-release-transpiler');
const pkg = require('../package.json');
const manifest = require('../.release-please-manifest.json');
const options = {
  outpath: '.',
  schemaLocation: 'src/schema.json',
  languages: { ts: true, go: true, rs: true, py: true }
};
(async () => {
  await verifyConditions(options);
  await prepare(options, {
    nextRelease: { version: pkg.version === '0.0.0-development' ? manifest['.'] : pkg.version }
  });
  require('fs').copyFileSync('src/schema.json', 'schema.json');
})().catch(error => { console.error(error); process.exitCode = 1; });

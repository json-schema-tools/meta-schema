const generated = require('../index.js');
const source = require('../src/schema.json');
const packaged = require('../schema.json');

test('generated and packaged schemas match the source', () => {
  expect(generated.default).toEqual(source);
  expect(generated.jsonSchema).toEqual(source);
  expect(packaged).toEqual(source);
});

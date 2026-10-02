module.exports = {
  testMatch: ['<rootDir>/tests/*.test.js'],
  collectCoverage: true,
  collectCoverageFrom: ['index.js'],
  coverageDirectory: require('path').join(__dirname, 'coverage'),
  coverageReporters: ['text', 'lcov', 'json-summary'],
  coverageThreshold: {
    global: { branches: 100, functions: 100, lines: 100, statements: 100 }
  }
};

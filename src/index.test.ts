import JSONMetaSchema from "./index";

describe("index", () => {
  it("can be imported and used", () => {
    expect(JSONMetaSchema).toBeDefined();
    expect(JSONMetaSchema.$id).toBeDefined();
    expect(JSONMetaSchema.$schema).toBeDefined();
  });
});

export const jsonSchema = {"$schema":"https://meta.json-schema.tools/","$id":"https://meta.json-schema.tools/","title":"JSONSchema","default":{},"oneOf":[{"$ref":"#/definitions/JSONSchemaObject"},{"$ref":"#/definitions/JSONSchemaBoolean"}],"definitions":{"$id":{"title":"$id","type":"string","format":"uri-reference"},"$schema":{"title":"$schema","type":"string","format":"uri"},"$ref":{"title":"$ref","type":"string","format":"uri-reference"},"$comment":{"title":"$comment","type":"string"},"title":{"title":"title","type":"string"},"description":{"title":"description","type":"string"},"AlwaysTrue":true,"readOnly":{"title":"readOnly","type":"boolean","default":false},"examples":{"title":"examples","type":"array","items":true},"multipleOf":{"title":"multipleOf","type":"number","exclusiveMinimum":0},"maximum":{"title":"maximum","type":"number"},"exclusiveMaximum":{"title":"exclusiveMaximum","type":"number"},"minimum":{"title":"minimum","type":"number"},"exclusiveMinimum":{"title":"exclusiveMinimum","type":"number"},"nonNegativeInteger":{"title":"nonNegativeInteger","type":"integer","minimum":0},"nonNegativeIntegerDefaultZero":{"title":"nonNegativeIntegerDefaultZero","type":"integer","minimum":0,"default":0},"pattern":{"title":"pattern","type":"string","format":"regex"},"JSONSchema":{"$ref":"#","isCycle":true},"schemaArray":{"title":"schemaArray","type":"array","minItems":1,"items":{"$ref":"#/definitions/JSONSchema","isCycle":true}},"items":{"title":"items","anyOf":[{"$ref":"#/definitions/JSONSchema","isCycle":true},{"$ref":"#/definitions/schemaArray"}],"default":true},"uniqueItems":{"title":"uniqueItems","type":"boolean","default":false},"string_doaGddGA":{"type":"string","title":"string_doaGddGA"},"stringArray":{"title":"stringArray","type":"array","items":{"$ref":"#/definitions/string_doaGddGA"},"uniqueItems":true,"default":[]},"definitions":{"title":"definitions","type":"object","additionalProperties":{"$ref":"#/definitions/JSONSchema","isCycle":true},"default":{}},"properties":{"title":"properties","type":"object","additionalProperties":{"$ref":"#/definitions/JSONSchema","isCycle":true},"default":{}},"patternProperties":{"title":"patternProperties","type":"object","additionalProperties":{"$ref":"#/definitions/JSONSchema","isCycle":true},"propertyNames":{"title":"propertyNames","format":"regex"},"default":{}},"dependenciesSet":{"title":"dependenciesSet","anyOf":[{"$ref":"#/definitions/JSONSchema","isCycle":true},{"$ref":"#/definitions/stringArray"}]},"dependencies":{"title":"dependencies","type":"object","additionalProperties":{"$ref":"#/definitions/dependenciesSet"}},"enum":{"title":"enum","type":"array","items":true,"minItems":1,"uniqueItems":true},"simpleTypes":{"title":"simpleTypes","enum":["array","boolean","integer","null","number","object","string"]},"arrayOfSimpleTypes":{"title":"arrayOfSimpleTypes","type":"array","items":{"$ref":"#/definitions/simpleTypes"},"minItems":1,"uniqueItems":true},"type":{"title":"type","anyOf":[{"$ref":"#/definitions/simpleTypes"},{"$ref":"#/definitions/arrayOfSimpleTypes"}]},"format":{"title":"format","type":"string"},"contentMediaType":{"title":"contentMediaType","type":"string"},"contentEncoding":{"title":"contentEncoding","type":"string"},"JSONSchemaObject":{"title":"JSONSchemaObject","type":"object","properties":{"$id":{"$ref":"#/definitions/$id"},"$schema":{"$ref":"#/definitions/$schema"},"$ref":{"$ref":"#/definitions/$ref"},"$comment":{"$ref":"#/definitions/$comment"},"title":{"$ref":"#/definitions/title"},"description":{"$ref":"#/definitions/description"},"default":true,"readOnly":{"$ref":"#/definitions/readOnly"},"examples":{"$ref":"#/definitions/examples"},"multipleOf":{"$ref":"#/definitions/multipleOf"},"maximum":{"$ref":"#/definitions/maximum"},"exclusiveMaximum":{"$ref":"#/definitions/exclusiveMaximum"},"minimum":{"$ref":"#/definitions/minimum"},"exclusiveMinimum":{"$ref":"#/definitions/exclusiveMinimum"},"maxLength":{"$ref":"#/definitions/nonNegativeInteger"},"minLength":{"$ref":"#/definitions/nonNegativeIntegerDefaultZero"},"pattern":{"$ref":"#/definitions/pattern"},"additionalItems":{"$ref":"#/definitions/JSONSchema","isCycle":true},"items":{"$ref":"#/definitions/items"},"maxItems":{"$ref":"#/definitions/nonNegativeInteger"},"minItems":{"$ref":"#/definitions/nonNegativeIntegerDefaultZero"},"uniqueItems":{"$ref":"#/definitions/uniqueItems"},"contains":{"$ref":"#/definitions/JSONSchema","isCycle":true},"maxProperties":{"$ref":"#/definitions/nonNegativeInteger"},"minProperties":{"$ref":"#/definitions/nonNegativeIntegerDefaultZero"},"required":{"$ref":"#/definitions/stringArray"},"additionalProperties":{"$ref":"#/definitions/JSONSchema","isCycle":true},"definitions":{"$ref":"#/definitions/definitions"},"properties":{"$ref":"#/definitions/properties"},"patternProperties":{"$ref":"#/definitions/patternProperties"},"dependencies":{"$ref":"#/definitions/dependencies"},"propertyNames":{"$ref":"#/definitions/JSONSchema","isCycle":true},"const":true,"enum":{"$ref":"#/definitions/enum"},"type":{"$ref":"#/definitions/type"},"format":{"$ref":"#/definitions/format"},"contentMediaType":{"$ref":"#/definitions/contentMediaType"},"contentEncoding":{"$ref":"#/definitions/contentEncoding"},"if":{"$ref":"#/definitions/JSONSchema","isCycle":true},"then":{"$ref":"#/definitions/JSONSchema","isCycle":true},"else":{"$ref":"#/definitions/JSONSchema","isCycle":true},"allOf":{"$ref":"#/definitions/schemaArray"},"anyOf":{"$ref":"#/definitions/schemaArray"},"oneOf":{"$ref":"#/definitions/schemaArray"},"not":{"$ref":"#/definitions/JSONSchema","isCycle":true}}},"JSONSchemaBoolean":{"title":"JSONSchemaBoolean","description":"Always valid if true. Never valid if false. Is constant.","type":"boolean"}},"isCycle":true};
export default jsonSchema
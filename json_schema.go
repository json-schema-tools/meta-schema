package json_schema


import "encoding/json"
import "errors"
type Id string
type Schema string
type Ref string
type Comment string
type Title string
type Description string
type AlwaysTrue interface{}
type ReadOnly bool
type Examples []AlwaysTrue
type MultipleOf float64
type Maximum float64
type ExclusiveMaximum float64
type Minimum float64
type ExclusiveMinimum float64
type NonNegativeInteger int64
type NonNegativeIntegerDefaultZero int64
type Pattern string
type SchemaArray []JSONSchema
//
// --- Default ---
//
// true
type Items struct {
	JSONSchema  *JSONSchema
	SchemaArray *SchemaArray
}
func (a *Items) UnmarshalJSON(bytes []byte) error {
	var ok bool
	var myJSONSchema JSONSchema
	if err := json.Unmarshal(bytes, &myJSONSchema); err == nil {
		ok = true
		a.JSONSchema = &myJSONSchema
	}
	var mySchemaArray SchemaArray
	if err := json.Unmarshal(bytes, &mySchemaArray); err == nil {
		ok = true
		a.SchemaArray = &mySchemaArray
	}
	if ok {
		return nil
	}
	return errors.New("failed to unmarshal any of the object properties")
}
func (o Items) MarshalJSON() ([]byte, error) {
	out := []interface{}{}
	if o.JSONSchema != nil {
		out = append(out, o.JSONSchema)
	}
	if o.SchemaArray != nil {
		out = append(out, o.SchemaArray)
	}
	return json.Marshal(out)
}
type UniqueItems bool
type StringDoaGddGA string
//
// --- Default ---
//
// []
type StringArray []StringDoaGddGA
//
// --- Default ---
//
// {}
type Definitions map[string]interface{}
//
// --- Default ---
//
// {}
type Properties map[string]interface{}
//
// --- Default ---
//
// {}
type PatternProperties map[string]interface{}
type DependenciesSet struct {
	JSONSchema  *JSONSchema
	StringArray *StringArray
}
func (a *DependenciesSet) UnmarshalJSON(bytes []byte) error {
	var ok bool
	var myJSONSchema JSONSchema
	if err := json.Unmarshal(bytes, &myJSONSchema); err == nil {
		ok = true
		a.JSONSchema = &myJSONSchema
	}
	var myStringArray StringArray
	if err := json.Unmarshal(bytes, &myStringArray); err == nil {
		ok = true
		a.StringArray = &myStringArray
	}
	if ok {
		return nil
	}
	return errors.New("failed to unmarshal any of the object properties")
}
func (o DependenciesSet) MarshalJSON() ([]byte, error) {
	out := []interface{}{}
	if o.JSONSchema != nil {
		out = append(out, o.JSONSchema)
	}
	if o.StringArray != nil {
		out = append(out, o.StringArray)
	}
	return json.Marshal(out)
}
type Dependencies map[string]interface{}
type Enum []AlwaysTrue
type SimpleTypes string
const (
	SimpleTypesEnum0 SimpleTypes = "array"
	SimpleTypesEnum1 SimpleTypes = "boolean"
	SimpleTypesEnum2 SimpleTypes = "integer"
	SimpleTypesEnum3 SimpleTypes = "null"
	SimpleTypesEnum4 SimpleTypes = "number"
	SimpleTypesEnum5 SimpleTypes = "object"
	SimpleTypesEnum6 SimpleTypes = "string"
)
type ArrayOfSimpleTypes []SimpleTypes
type Type struct {
	SimpleTypes        *SimpleTypes
	ArrayOfSimpleTypes *ArrayOfSimpleTypes
}
func (a *Type) UnmarshalJSON(bytes []byte) error {
	var ok bool
	var mySimpleTypes SimpleTypes
	if err := json.Unmarshal(bytes, &mySimpleTypes); err == nil {
		ok = true
		a.SimpleTypes = &mySimpleTypes
	}
	var myArrayOfSimpleTypes ArrayOfSimpleTypes
	if err := json.Unmarshal(bytes, &myArrayOfSimpleTypes); err == nil {
		ok = true
		a.ArrayOfSimpleTypes = &myArrayOfSimpleTypes
	}
	if ok {
		return nil
	}
	return errors.New("failed to unmarshal any of the object properties")
}
func (o Type) MarshalJSON() ([]byte, error) {
	out := []interface{}{}
	if o.SimpleTypes != nil {
		out = append(out, o.SimpleTypes)
	}
	if o.ArrayOfSimpleTypes != nil {
		out = append(out, o.ArrayOfSimpleTypes)
	}
	return json.Marshal(out)
}
type Format string
type ContentMediaType string
type ContentEncoding string
type JSONSchemaObject struct {
	Id                   *Id                            `json:"$id,omitempty"`
	Schema               *Schema                        `json:"$schema,omitempty"`
	Ref                  *Ref                           `json:"$ref,omitempty"`
	Comment              *Comment                       `json:"$comment,omitempty"`
	Title                *Title                         `json:"title,omitempty"`
	Description          *Description                   `json:"description,omitempty"`
	Default              *AlwaysTrue                    `json:"default,omitempty"`
	ReadOnly             *ReadOnly                      `json:"readOnly,omitempty"`
	Examples             *Examples                      `json:"examples,omitempty"`
	MultipleOf           *MultipleOf                    `json:"multipleOf,omitempty"`
	Maximum              *Maximum                       `json:"maximum,omitempty"`
	ExclusiveMaximum     *ExclusiveMaximum              `json:"exclusiveMaximum,omitempty"`
	Minimum              *Minimum                       `json:"minimum,omitempty"`
	ExclusiveMinimum     *ExclusiveMinimum              `json:"exclusiveMinimum,omitempty"`
	MaxLength            *NonNegativeInteger            `json:"maxLength,omitempty"`
	MinLength            *NonNegativeIntegerDefaultZero `json:"minLength,omitempty"`
	Pattern              *Pattern                       `json:"pattern,omitempty"`
	AdditionalItems      *JSONSchema                    `json:"additionalItems,omitempty"`
	Items                *Items                         `json:"items,omitempty"`
	MaxItems             *NonNegativeInteger            `json:"maxItems,omitempty"`
	MinItems             *NonNegativeIntegerDefaultZero `json:"minItems,omitempty"`
	UniqueItems          *UniqueItems                   `json:"uniqueItems,omitempty"`
	Contains             *JSONSchema                    `json:"contains,omitempty"`
	MaxProperties        *NonNegativeInteger            `json:"maxProperties,omitempty"`
	MinProperties        *NonNegativeIntegerDefaultZero `json:"minProperties,omitempty"`
	Required             *StringArray                   `json:"required,omitempty"`
	AdditionalProperties *JSONSchema                    `json:"additionalProperties,omitempty"`
	Definitions          *Definitions                   `json:"definitions,omitempty"`
	Properties           *Properties                    `json:"properties,omitempty"`
	PatternProperties    *PatternProperties             `json:"patternProperties,omitempty"`
	Dependencies         *Dependencies                  `json:"dependencies,omitempty"`
	PropertyNames        *JSONSchema                    `json:"propertyNames,omitempty"`
	Const                *AlwaysTrue                    `json:"const,omitempty"`
	Enum                 *Enum                          `json:"enum,omitempty"`
	Type                 *Type                          `json:"type,omitempty"`
	Format               *Format                        `json:"format,omitempty"`
	ContentMediaType     *ContentMediaType              `json:"contentMediaType,omitempty"`
	ContentEncoding      *ContentEncoding               `json:"contentEncoding,omitempty"`
	If                   *JSONSchema                    `json:"if,omitempty"`
	Then                 *JSONSchema                    `json:"then,omitempty"`
	Else                 *JSONSchema                    `json:"else,omitempty"`
	AllOf                *SchemaArray                   `json:"allOf,omitempty"`
	AnyOf                *SchemaArray                   `json:"anyOf,omitempty"`
	OneOf                *SchemaArray                   `json:"oneOf,omitempty"`
	Not                  *JSONSchema                    `json:"not,omitempty"`
}
// Always valid if true. Never valid if false. Is constant.
type JSONSchemaBoolean bool
//
// --- Default ---
//
// {}
type JSONSchema struct {
	JSONSchemaObject  *JSONSchemaObject
	JSONSchemaBoolean *JSONSchemaBoolean
}
// UnmarshalJSON implements the json Unmarshaler interface.
// This implementation DOES NOT assert that ONE AND ONLY ONE
// of the simple properties is satisfied; it lazily uses the first one that is satisfied.
// Ergo, it will not return an error if more than one property is valid.
func (o *JSONSchema) UnmarshalJSON(bytes []byte) error {
	var myJSONSchemaObject JSONSchemaObject
	if err := json.Unmarshal(bytes, &myJSONSchemaObject); err == nil {
		o.JSONSchemaObject = &myJSONSchemaObject
		return nil
	}
	var myJSONSchemaBoolean JSONSchemaBoolean
	if err := json.Unmarshal(bytes, &myJSONSchemaBoolean); err == nil {
		o.JSONSchemaBoolean = &myJSONSchemaBoolean
		return nil
	}
	return errors.New("failed to unmarshal one of the object properties")
}
func (o JSONSchema) MarshalJSON() ([]byte, error) {
	if o.JSONSchemaObject != nil {
		return json.Marshal(o.JSONSchemaObject)
	}
	if o.JSONSchemaBoolean != nil {
		return json.Marshal(o.JSONSchemaBoolean)
	}
	return nil, errors.New("failed to marshal any one of the object properties")
}

const RawJson_schema = "{\"$schema\":\"https://meta.json-schema.tools/\",\"$id\":\"https://meta.json-schema.tools/\",\"title\":\"JSONSchema\",\"default\":{},\"oneOf\":[{\"$ref\":\"#/definitions/JSONSchemaObject\"},{\"$ref\":\"#/definitions/JSONSchemaBoolean\"}],\"definitions\":{\"$id\":{\"title\":\"$id\",\"type\":\"string\",\"format\":\"uri-reference\"},\"$schema\":{\"title\":\"$schema\",\"type\":\"string\",\"format\":\"uri\"},\"$ref\":{\"title\":\"$ref\",\"type\":\"string\",\"format\":\"uri-reference\"},\"$comment\":{\"title\":\"$comment\",\"type\":\"string\"},\"title\":{\"title\":\"title\",\"type\":\"string\"},\"description\":{\"title\":\"description\",\"type\":\"string\"},\"AlwaysTrue\":true,\"readOnly\":{\"title\":\"readOnly\",\"type\":\"boolean\",\"default\":false},\"examples\":{\"title\":\"examples\",\"type\":\"array\",\"items\":true},\"multipleOf\":{\"title\":\"multipleOf\",\"type\":\"number\",\"exclusiveMinimum\":0},\"maximum\":{\"title\":\"maximum\",\"type\":\"number\"},\"exclusiveMaximum\":{\"title\":\"exclusiveMaximum\",\"type\":\"number\"},\"minimum\":{\"title\":\"minimum\",\"type\":\"number\"},\"exclusiveMinimum\":{\"title\":\"exclusiveMinimum\",\"type\":\"number\"},\"nonNegativeInteger\":{\"title\":\"nonNegativeInteger\",\"type\":\"integer\",\"minimum\":0},\"nonNegativeIntegerDefaultZero\":{\"title\":\"nonNegativeIntegerDefaultZero\",\"type\":\"integer\",\"minimum\":0,\"default\":0},\"pattern\":{\"title\":\"pattern\",\"type\":\"string\",\"format\":\"regex\"},\"JSONSchema\":{\"$ref\":\"#\",\"isCycle\":true},\"schemaArray\":{\"title\":\"schemaArray\",\"type\":\"array\",\"minItems\":1,\"items\":{\"$ref\":\"#/definitions/JSONSchema\",\"isCycle\":true}},\"items\":{\"title\":\"items\",\"anyOf\":[{\"$ref\":\"#/definitions/JSONSchema\",\"isCycle\":true},{\"$ref\":\"#/definitions/schemaArray\"}],\"default\":true},\"uniqueItems\":{\"title\":\"uniqueItems\",\"type\":\"boolean\",\"default\":false},\"string_doaGddGA\":{\"type\":\"string\",\"title\":\"string_doaGddGA\"},\"stringArray\":{\"title\":\"stringArray\",\"type\":\"array\",\"items\":{\"$ref\":\"#/definitions/string_doaGddGA\"},\"uniqueItems\":true,\"default\":[]},\"definitions\":{\"title\":\"definitions\",\"type\":\"object\",\"additionalProperties\":{\"$ref\":\"#/definitions/JSONSchema\",\"isCycle\":true},\"default\":{}},\"properties\":{\"title\":\"properties\",\"type\":\"object\",\"additionalProperties\":{\"$ref\":\"#/definitions/JSONSchema\",\"isCycle\":true},\"default\":{}},\"patternProperties\":{\"title\":\"patternProperties\",\"type\":\"object\",\"additionalProperties\":{\"$ref\":\"#/definitions/JSONSchema\",\"isCycle\":true},\"propertyNames\":{\"title\":\"propertyNames\",\"format\":\"regex\"},\"default\":{}},\"dependenciesSet\":{\"title\":\"dependenciesSet\",\"anyOf\":[{\"$ref\":\"#/definitions/JSONSchema\",\"isCycle\":true},{\"$ref\":\"#/definitions/stringArray\"}]},\"dependencies\":{\"title\":\"dependencies\",\"type\":\"object\",\"additionalProperties\":{\"$ref\":\"#/definitions/dependenciesSet\"}},\"enum\":{\"title\":\"enum\",\"type\":\"array\",\"items\":true,\"minItems\":1,\"uniqueItems\":true},\"simpleTypes\":{\"title\":\"simpleTypes\",\"type\":\"string\",\"enum\":[\"array\",\"boolean\",\"integer\",\"null\",\"number\",\"object\",\"string\"]},\"arrayOfSimpleTypes\":{\"title\":\"arrayOfSimpleTypes\",\"type\":\"array\",\"items\":{\"$ref\":\"#/definitions/simpleTypes\"},\"minItems\":1,\"uniqueItems\":true},\"type\":{\"title\":\"type\",\"anyOf\":[{\"$ref\":\"#/definitions/simpleTypes\"},{\"$ref\":\"#/definitions/arrayOfSimpleTypes\"}]},\"format\":{\"title\":\"format\",\"type\":\"string\"},\"contentMediaType\":{\"title\":\"contentMediaType\",\"type\":\"string\"},\"contentEncoding\":{\"title\":\"contentEncoding\",\"type\":\"string\"},\"JSONSchemaObject\":{\"title\":\"JSONSchemaObject\",\"type\":\"object\",\"properties\":{\"$id\":{\"$ref\":\"#/definitions/$id\"},\"$schema\":{\"$ref\":\"#/definitions/$schema\"},\"$ref\":{\"$ref\":\"#/definitions/$ref\"},\"$comment\":{\"$ref\":\"#/definitions/$comment\"},\"title\":{\"$ref\":\"#/definitions/title\"},\"description\":{\"$ref\":\"#/definitions/description\"},\"default\":true,\"readOnly\":{\"$ref\":\"#/definitions/readOnly\"},\"examples\":{\"$ref\":\"#/definitions/examples\"},\"multipleOf\":{\"$ref\":\"#/definitions/multipleOf\"},\"maximum\":{\"$ref\":\"#/definitions/maximum\"},\"exclusiveMaximum\":{\"$ref\":\"#/definitions/exclusiveMaximum\"},\"minimum\":{\"$ref\":\"#/definitions/minimum\"},\"exclusiveMinimum\":{\"$ref\":\"#/definitions/exclusiveMinimum\"},\"maxLength\":{\"$ref\":\"#/definitions/nonNegativeInteger\"},\"minLength\":{\"$ref\":\"#/definitions/nonNegativeIntegerDefaultZero\"},\"pattern\":{\"$ref\":\"#/definitions/pattern\"},\"additionalItems\":{\"$ref\":\"#/definitions/JSONSchema\",\"isCycle\":true},\"items\":{\"$ref\":\"#/definitions/items\"},\"maxItems\":{\"$ref\":\"#/definitions/nonNegativeInteger\"},\"minItems\":{\"$ref\":\"#/definitions/nonNegativeIntegerDefaultZero\"},\"uniqueItems\":{\"$ref\":\"#/definitions/uniqueItems\"},\"contains\":{\"$ref\":\"#/definitions/JSONSchema\",\"isCycle\":true},\"maxProperties\":{\"$ref\":\"#/definitions/nonNegativeInteger\"},\"minProperties\":{\"$ref\":\"#/definitions/nonNegativeIntegerDefaultZero\"},\"required\":{\"$ref\":\"#/definitions/stringArray\"},\"additionalProperties\":{\"$ref\":\"#/definitions/JSONSchema\",\"isCycle\":true},\"definitions\":{\"$ref\":\"#/definitions/definitions\"},\"properties\":{\"$ref\":\"#/definitions/properties\"},\"patternProperties\":{\"$ref\":\"#/definitions/patternProperties\"},\"dependencies\":{\"$ref\":\"#/definitions/dependencies\"},\"propertyNames\":{\"$ref\":\"#/definitions/JSONSchema\",\"isCycle\":true},\"const\":true,\"enum\":{\"$ref\":\"#/definitions/enum\"},\"type\":{\"$ref\":\"#/definitions/type\"},\"format\":{\"$ref\":\"#/definitions/format\"},\"contentMediaType\":{\"$ref\":\"#/definitions/contentMediaType\"},\"contentEncoding\":{\"$ref\":\"#/definitions/contentEncoding\"},\"if\":{\"$ref\":\"#/definitions/JSONSchema\",\"isCycle\":true},\"then\":{\"$ref\":\"#/definitions/JSONSchema\",\"isCycle\":true},\"else\":{\"$ref\":\"#/definitions/JSONSchema\",\"isCycle\":true},\"allOf\":{\"$ref\":\"#/definitions/schemaArray\"},\"anyOf\":{\"$ref\":\"#/definitions/schemaArray\"},\"oneOf\":{\"$ref\":\"#/definitions/schemaArray\"},\"not\":{\"$ref\":\"#/definitions/JSONSchema\",\"isCycle\":true}}},\"JSONSchemaBoolean\":{\"title\":\"JSONSchemaBoolean\",\"description\":\"Always valid if true. Never valid if false. Is constant.\",\"type\":\"boolean\"}},\"isCycle\":true}"
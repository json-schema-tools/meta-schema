extern crate serde;
extern crate serde_json;
extern crate derive_builder;

use derive_builder::Builder;
use serde::{Serialize, Deserialize};
use std::collections::HashMap;

pub type Id = String;
pub type Schema = String;
pub type Ref = String;
pub type Comment = String;
pub type Title = String;
pub type Description = String;
type AlwaysTrue = serde_json::Value;
pub type ReadOnly = bool;
pub type Examples = Vec<AlwaysTrue>;
pub type MultipleOf = f64;
pub type Maximum = f64;
pub type ExclusiveMaximum = f64;
pub type Minimum = f64;
pub type ExclusiveMinimum = f64;
pub type NonNegativeInteger = i64;
pub type NonNegativeIntegerDefaultZero = i64;
pub type Pattern = String;
pub type SchemaArray = Vec<JSONSchema>;

#[derive(Serialize, Deserialize, Clone, Debug, Eq, PartialEq)]
pub enum Items {
    JSONSchema,
    SchemaArray
}
pub type UniqueItems = bool;
pub type StringDoaGddGA = String;
/// StringArray
///
/// # Default
///
/// []
///
pub type StringArray = Vec<StringDoaGddGA>;
/// Definitions
///
/// # Default
///
/// {}
///
pub type Definitions = HashMap<String, Option<serde_json::Value>>;
/// Properties
///
/// # Default
///
/// {}
///
pub type Properties = HashMap<String, Option<JSONSchema>>;
/// PatternProperties
///
/// # Default
///
/// {}
///
pub type PatternProperties = HashMap<String, Option<serde_json::Value>>;

#[derive(Serialize, Deserialize, Clone, Debug, Eq, PartialEq)]
pub enum DependenciesSet {
    JSONSchema,
    StringArray
}
pub type Dependencies = HashMap<String, Option<serde_json::Value>>;
pub type Enum = Vec<AlwaysTrue>;

#[derive(Serialize, Deserialize, Clone, Debug, Eq, PartialEq)]
pub enum SimpleTypes {
    #[serde(rename = "string")]
    String,
    #[serde(rename = "array")]
    Array,
    #[serde(rename = "object")]
    Object,
    #[serde(rename = "number")]
    Number,
    #[serde(rename = "boolean")]
    Boolean,
    #[serde(rename = "integer")]
    Integer
}

pub type ArrayOfSimpleTypes = Vec<SimpleTypes>;

#[derive(Serialize, Deserialize, Clone, Debug, Eq, PartialEq)]
#[serde(untagged)]
pub enum Type {
    SimpleTypes(SimpleTypes),
    ArrayOfSimpleTypes(ArrayOfSimpleTypes)
}

pub type Format = String;
pub type ContentMediaType = String;
pub type ContentEncoding = String;

#[derive(Serialize, Deserialize, Clone, Debug, PartialEq, Builder, Default)]
#[builder(setter(strip_option), default)]
#[serde(default)]
pub struct JSONSchemaObject {
    #[serde(rename="$id", skip_serializing_if = "Option::is_none")]
    pub id: Option<Id>,
    #[serde(rename="$schema", skip_serializing_if = "Option::is_none")]
    pub schema: Option<Schema>,
    #[serde(rename="$ref", skip_serializing_if = "Option::is_none")]
    pub _ref: Option<Ref>,
    #[serde(rename="$comment", skip_serializing_if = "Option::is_none")]
    pub comment: Option<Comment>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub title: Option<Title>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub(crate) description: Option<Description>,

    #[serde(rename="default", skip_serializing_if = "Option::is_none")]
    pub(crate) _default: Option<AlwaysTrue>,

    #[serde(rename="readOnly")]
    pub(crate) read_only: Option<ReadOnly>,
    pub(crate) examples: Option<Examples>,
    #[serde(rename="multipleOf")]
    pub(crate) multiple_of: Option<MultipleOf>,
    pub(crate) maximum: Option<Maximum>,
    #[serde(rename="exclusiveMaximum")]
    pub(crate) exclusive_maximum: Option<ExclusiveMaximum>,
    pub(crate) minimum: Option<Minimum>,
    #[serde(rename="exclusiveMinimum")]
    pub(crate) exclusive_minimum: Option<ExclusiveMinimum>,
    #[serde(rename="maxLength")]
    pub(crate) max_length: Option<NonNegativeInteger>,
    #[serde(rename="minLength")]
    pub(crate) min_length: Option<NonNegativeIntegerDefaultZero>,
    pub(crate) pattern: Option<Pattern>,
    #[serde(rename="additionalItems")]
    pub(crate) additional_items: Option<Box<JSONSchema>>,
    pub(crate) items: Option<Items>,
    #[serde(rename="maxItems")]
    pub(crate) max_items: Option<NonNegativeInteger>,
    #[serde(rename="minItems")]
    pub(crate) min_items: Option<NonNegativeIntegerDefaultZero>,
    #[serde(rename="uniqueItems")]
    pub(crate) unique_items: Option<UniqueItems>,
    pub contains: Option<Box<JSONSchema>>,
    #[serde(rename="maxProperties")]
    pub(crate) max_properties: Option<NonNegativeInteger>,
    #[serde(rename="minProperties")]
    pub(crate) min_properties: Option<NonNegativeIntegerDefaultZero>,
    pub(crate) required: Option<StringArray>,
    #[serde(rename="additionalProperties")]
    pub(crate) additional_properties: Option<Box<JSONSchema>>,
    pub(crate) definitions: Option<Definitions>,
    pub properties: Option<Properties>,
    #[serde(rename="patternProperties")]
    pub(crate) pattern_properties: Option<PatternProperties>,
    pub(crate) dependencies: Option<Dependencies>,
    #[serde(rename="propertyNames")]
    pub(crate) property_names: Option<Box<JSONSchema>>,
    #[serde(rename="const")]
    pub(crate) _const: Option<AlwaysTrue>,
    #[serde(rename="enum")]
    pub(crate) _enum: Option<Enum>,
    #[serde(rename="type")]
    pub _type: Option<Type>,
    pub(crate) format: Option<Format>,
    #[serde(rename="contentMediaType")]
    pub(crate) content_media_type: Option<ContentMediaType>,
    #[serde(rename="contentEncoding")]
    pub(crate) content_encoding: Option<ContentEncoding>,
    #[serde(rename="if")]
    pub(crate) _if: Option<Box<JSONSchema>>,
    pub(crate) then: Option<Box<JSONSchema>>,
    #[serde(rename="else")]
    pub(crate) _else: Option<Box<JSONSchema>>,
    #[serde(rename="allOf")]
    pub(crate) all_of: Option<Box<JSONSchema>>,
    #[serde(rename="anyOf")]
    pub(crate) any_of: Option<Box<JSONSchema>>,
    #[serde(rename="oneOf")]
    pub(crate) one_of: Option<SchemaArray>,
    pub(crate) not: Option<Box<JSONSchema>>,
}
/// JSONSchemaBoolean
///
/// Always valid if true. Never valid if false. Is constant.
///
pub type JSONSchemaBoolean = bool;

#[derive(Serialize, Deserialize, Clone, Debug, PartialEq)]
#[serde(untagged)]
pub enum JSONSchema {
    JSONSchemaObject(JSONSchemaObject),
    JSONSchemaBoolean(JSONSchemaBoolean)
}

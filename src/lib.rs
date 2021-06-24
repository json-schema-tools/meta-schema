extern crate serde;
extern crate serde_json;
extern crate derive_builder;

use serde::{Serialize, Deserialize};
use std::collections::HashMap;
use derive_builder::Builder;
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
#[derive(Serialize, Deserialize, Clone, Debug, PartialEq)]
#[serde(untagged)]
pub enum Items {
    JSONSchema(Box<JSONSchema>),
    SchemaArray(SchemaArray),
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
pub type Definitions = HashMap<String, JSONSchema>;
/// Properties
///
/// # Default
///
/// {}
///
pub type Properties = HashMap<String, JSONSchema>;
/// PatternProperties
///
/// # Default
///
/// {}
///
pub type PatternProperties = HashMap<String, JSONSchema>;
#[derive(Serialize, Deserialize, Clone, Debug, PartialEq)]
#[serde(untagged)]
pub enum DependenciesSet {
    JSONSchema(Box<JSONSchema>),
    StringArray(StringArray),
}
pub type Dependencies = HashMap<String, DependenciesSet>;
pub type Enum = Vec<AlwaysTrue>;
#[derive(Serialize, Deserialize, Clone, Debug, Eq, PartialEq)]
pub enum SimpleTypes {
    #[serde(rename = "array")]
    Array,
    #[serde(rename = "boolean")]
    Boolean,
    #[serde(rename = "integer")]
    Integer,
    #[serde(rename = "null")]
    Null,
    #[serde(rename = "number")]
    Number,
    #[serde(rename = "object")]
    Object,
    #[serde(rename = "string")]
    String,
}
pub type ArrayOfSimpleTypes = Vec<SimpleTypes>;
#[derive(Serialize, Deserialize, Clone, Debug, PartialEq)]
#[serde(untagged)]
pub enum Type {
    SimpleTypes(SimpleTypes),
    ArrayOfSimpleTypes(ArrayOfSimpleTypes),
}
pub type Format = String;
pub type ContentMediaType = String;
pub type ContentEncoding = String;
#[derive(Serialize, Deserialize, Clone, Debug, PartialEq, Builder, Default)]
#[builder(setter(strip_option), default)]
#[serde(default)]
pub struct JSONSchemaObject {
    #[serde(rename = "$id", skip_serializing_if = "Option::is_none")]
    pub id: Option<Id>,
    #[serde(rename = "$schema", skip_serializing_if = "Option::is_none")]
    pub schema: Option<Schema>,
    #[serde(rename = "$ref", skip_serializing_if = "Option::is_none")]
    pub _ref: Option<Ref>,
    #[serde(rename = "$comment", skip_serializing_if = "Option::is_none")]
    pub comment: Option<Comment>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub title: Option<Title>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub description: Option<Description>,
    #[serde(rename = "default", skip_serializing_if = "Option::is_none")]
    pub _default: Option<AlwaysTrue>,
    #[serde(rename = "readOnly", skip_serializing_if = "Option::is_none")]
    pub read_only: Option<ReadOnly>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub examples: Option<Examples>,
    #[serde(rename = "multipleOf", skip_serializing_if = "Option::is_none")]
    pub multiple_of: Option<MultipleOf>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub maximum: Option<Maximum>,
    #[serde(rename = "exclusiveMaximum", skip_serializing_if = "Option::is_none")]
    pub exclusive_maximum: Option<ExclusiveMaximum>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub minimum: Option<Minimum>,
    #[serde(rename = "exclusiveMinimum", skip_serializing_if = "Option::is_none")]
    pub exclusive_minimum: Option<ExclusiveMinimum>,
    #[serde(rename = "maxLength", skip_serializing_if = "Option::is_none")]
    pub max_length: Option<NonNegativeInteger>,
    #[serde(rename = "minLength", skip_serializing_if = "Option::is_none")]
    pub min_length: Option<NonNegativeIntegerDefaultZero>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub pattern: Option<Pattern>,
    #[serde(rename = "additionalItems", skip_serializing_if = "Option::is_none")]
    pub additional_items: Option<Box<JSONSchema>>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub items: Option<Items>,
    #[serde(rename = "maxItems", skip_serializing_if = "Option::is_none")]
    pub max_items: Option<NonNegativeInteger>,
    #[serde(rename = "minItems", skip_serializing_if = "Option::is_none")]
    pub min_items: Option<NonNegativeIntegerDefaultZero>,
    #[serde(rename = "uniqueItems", skip_serializing_if = "Option::is_none")]
    pub unique_items: Option<UniqueItems>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub contains: Option<Box<JSONSchema>>,
    #[serde(rename = "maxProperties", skip_serializing_if = "Option::is_none")]
    pub max_properties: Option<NonNegativeInteger>,
    #[serde(rename = "minProperties", skip_serializing_if = "Option::is_none")]
    pub min_properties: Option<NonNegativeIntegerDefaultZero>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub required: Option<StringArray>,
    #[serde(rename = "additionalProperties", skip_serializing_if = "Option::is_none")]
    pub additional_properties: Option<Box<JSONSchema>>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub definitions: Option<Definitions>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub properties: Option<Properties>,
    #[serde(rename = "patternProperties", skip_serializing_if = "Option::is_none")]
    pub pattern_properties: Option<PatternProperties>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub dependencies: Option<Dependencies>,
    #[serde(rename = "propertyNames", skip_serializing_if = "Option::is_none")]
    pub property_names: Option<Box<JSONSchema>>,
    #[serde(rename = "const", skip_serializing_if = "Option::is_none")]
    pub _const: Option<AlwaysTrue>,
    #[serde(rename = "enum", skip_serializing_if = "Option::is_none")]
    pub _enum: Option<Enum>,
    #[serde(rename = "type", skip_serializing_if = "Option::is_none")]
    pub _type: Option<Type>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub format: Option<Format>,
    #[serde(rename = "contentMediaType", skip_serializing_if = "Option::is_none")]
    pub content_media_type: Option<ContentMediaType>,
    #[serde(rename = "contentEncoding", skip_serializing_if = "Option::is_none")]
    pub content_encoding: Option<ContentEncoding>,
    #[serde(rename = "if", skip_serializing_if = "Option::is_none")]
    pub _if: Option<Box<JSONSchema>>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub then: Option<Box<JSONSchema>>,
    #[serde(rename = "else", skip_serializing_if = "Option::is_none")]
    pub _else: Option<Box<JSONSchema>>,
    #[serde(rename = "allOf", skip_serializing_if = "Option::is_none")]
    pub all_of: Option<SchemaArray>,
    #[serde(rename = "anyOf", skip_serializing_if = "Option::is_none")]
    pub any_of: Option<SchemaArray>,
    #[serde(rename = "oneOf", skip_serializing_if = "Option::is_none")]
    pub one_of: Option<SchemaArray>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub not: Option<Box<JSONSchema>>,
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
    JSONSchemaBoolean(JSONSchemaBoolean),
}
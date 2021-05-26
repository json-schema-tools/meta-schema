extern crate serde_json;

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
#[derive(Serialize, Deserialize)]
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
pub type Properties = HashMap<String, Option<serde_json::Value>>;
/// PatternProperties
///
/// # Default
///
/// {}
///
pub type PatternProperties = HashMap<String, Option<serde_json::Value>>;
#[derive(Serialize, Deserialize)]
pub enum DependenciesSet {
    JSONSchema,
    StringArray
}
pub type Dependencies = HashMap<String, Option<serde_json::Value>>;
pub type Enum = Vec<AlwaysTrue>;
pub type SimpleTypes = serde_json::Value;
pub type ArrayOfSimpleTypes = Vec<SimpleTypes>;
#[derive(Serialize, Deserialize)]
pub enum Type {
    SimpleTypes,
    ArrayOfSimpleTypes
}
pub type Format = String;
pub type ContentMediaType = String;
pub type ContentEncoding = String;
#[derive(Serialize, Deserialize)]
pub struct JSONSchemaObject {
    #[serde(rename="$id")]
    pub(crate) id: Option<Id>,
    #[serde(rename="$schema")]
    pub(crate) schema: Option<Schema>,
    #[serde(rename="$ref")]
    pub(crate) ref: Option<Ref>,
    #[serde(rename="$comment")]
    pub(crate) comment: Option<Comment>,
    pub(crate) title: Option<Title>,
    pub(crate) description: Option<Description>,
    pub(crate) default: Option<AlwaysTrue>,
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
    pub(crate) additional_items: Option<JSONSchema>,
    pub(crate) items: Option<Items>,
    #[serde(rename="maxItems")]
    pub(crate) max_items: Option<NonNegativeInteger>,
    #[serde(rename="minItems")]
    pub(crate) min_items: Option<NonNegativeIntegerDefaultZero>,
    #[serde(rename="uniqueItems")]
    pub(crate) unique_items: Option<UniqueItems>,
    pub(crate) contains: Option<JSONSchema>,
    #[serde(rename="maxProperties")]
    pub(crate) max_properties: Option<NonNegativeInteger>,
    #[serde(rename="minProperties")]
    pub(crate) min_properties: Option<NonNegativeIntegerDefaultZero>,
    pub(crate) required: Option<StringArray>,
    #[serde(rename="additionalProperties")]
    pub(crate) additional_properties: Option<JSONSchema>,
    pub(crate) definitions: Option<Definitions>,
    pub(crate) properties: Option<Properties>,
    #[serde(rename="patternProperties")]
    pub(crate) pattern_properties: Option<PatternProperties>,
    pub(crate) dependencies: Option<Dependencies>,
    #[serde(rename="propertyNames")]
    pub(crate) property_names: Option<JSONSchema>,
    #[serde(rename="const")]
    pub(crate) _const: Option<AlwaysTrue>,
    #[serde(rename="enum")]
    pub(crate) _enum: Option<Enum>,
    #[serde(rename="type")]
    pub(crate) _type: Option<Type>,
    pub(crate) format: Option<Format>,
    #[serde(rename="contentMediaType")]
    pub(crate) content_media_type: Option<ContentMediaType>,
    #[serde(rename="contentEncoding")]
    pub(crate) content_encoding: Option<ContentEncoding>,
    #[serde(rename="if")]
    pub(crate) _if: Option<JSONSchema>,
    pub(crate) then: Option<JSONSchema>,
    #[serde(rename="else")]
    pub(crate) _else: Option<JSONSchema>,
    #[serde(rename="allOf")]
    pub(crate) all_of: Option<SchemaArray>,
    #[serde(rename="anyOf")]
    pub(crate) any_of: Option<SchemaArray>,
    #[serde(rename="oneOf")]
    pub(crate) one_of: Option<SchemaArray>,
    pub(crate) not: Option<JSONSchema>,
}
/// JSONSchemaBoolean
///
/// Always valid if true. Never valid if false. Is constant.
///
pub type JSONSchemaBoolean = bool;
#[derive(Serialize, Deserialize)]
pub enum JSONSchema {
    JSONSchemaObject,
    JSONSchemaBoolean
}
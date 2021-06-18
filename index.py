from typing import NewType
from typing import Union
from typing import Any
from typing import List
from typing import Mapping
from typing import TypedDict
from typing import Optional

Id = NewType("Id", str)

Schema = NewType("Schema", str)

Ref = NewType("Ref", str)

Comment = NewType("Comment", str)

Title = NewType("Title", str)

Description = NewType("Description", str)
AlwaysTrue = NewType("AlwaysTrue", Any)

ReadOnly = NewType("ReadOnly", bool)

Examples = NewType("Examples", List[AlwaysTrue])

MultipleOf = NewType("MultipleOf", float)

Maximum = NewType("Maximum", float)

ExclusiveMaximum = NewType("ExclusiveMaximum", float)

Minimum = NewType("Minimum", float)

ExclusiveMinimum = NewType("ExclusiveMinimum", float)

NonNegativeInteger = NewType("NonNegativeInteger", int)

NonNegativeIntegerDefaultZero = NewType("NonNegativeIntegerDefaultZero", int)

Pattern = NewType("Pattern", str)

SchemaArray = NewType("SchemaArray", List[JSONSchema])

Items = NewType("Items", Union[JSONSchema, SchemaArray])

UniqueItems = NewType("UniqueItems", bool)

StringDoaGddGA = NewType("StringDoaGddGA", str)

StringArray = NewType("StringArray", List[StringDoaGddGA])

Definitions = NewType("Definitions", Mapping[Any, Any])

Properties = NewType("Properties", Mapping[Any, Any])

PatternProperties = NewType("PatternProperties", Mapping[Any, Any])

DependenciesSet = NewType("DependenciesSet", Union[JSONSchema, StringArray])

Dependencies = NewType("Dependencies", Mapping[Any, Any])

Enum = NewType("Enum", List[AlwaysTrue])

SimpleTypes = NewType("SimpleTypes", Mapping[Any, Any])

ArrayOfSimpleTypes = NewType("ArrayOfSimpleTypes", List[SimpleTypes])

Type = NewType("Type", Union[SimpleTypes, ArrayOfSimpleTypes])

Format = NewType("Format", str)

ContentMediaType = NewType("ContentMediaType", str)

ContentEncoding = NewType("ContentEncoding", str)

class JSONSchemaObject(TypedDict):
    $id: Optional[Id]
    $schema: Optional[Schema]
    $ref: Optional[Ref]
    $comment: Optional[Comment]
    title: Optional[Title]
    description: Optional[Description]
    default: Optional[AlwaysTrue]
    readOnly: Optional[ReadOnly]
    examples: Optional[Examples]
    multipleOf: Optional[MultipleOf]
    maximum: Optional[Maximum]
    exclusiveMaximum: Optional[ExclusiveMaximum]
    minimum: Optional[Minimum]
    exclusiveMinimum: Optional[ExclusiveMinimum]
    maxLength: Optional[NonNegativeInteger]
    minLength: Optional[NonNegativeIntegerDefaultZero]
    pattern: Optional[Pattern]
    additionalItems: Optional[JSONSchema]
    items: Optional[Items]
    maxItems: Optional[NonNegativeInteger]
    minItems: Optional[NonNegativeIntegerDefaultZero]
    uniqueItems: Optional[UniqueItems]
    contains: Optional[JSONSchema]
    maxProperties: Optional[NonNegativeInteger]
    minProperties: Optional[NonNegativeIntegerDefaultZero]
    required: Optional[StringArray]
    additionalProperties: Optional[JSONSchema]
    definitions: Optional[Definitions]
    properties: Optional[Properties]
    patternProperties: Optional[PatternProperties]
    dependencies: Optional[Dependencies]
    propertyNames: Optional[JSONSchema]
    const: Optional[AlwaysTrue]
    enum: Optional[Enum]
    type: Optional[Type]
    format: Optional[Format]
    contentMediaType: Optional[ContentMediaType]
    contentEncoding: Optional[ContentEncoding]
    if: Optional[JSONSchema]
    then: Optional[JSONSchema]
    else: Optional[JSONSchema]
    allOf: Optional[SchemaArray]
    anyOf: Optional[SchemaArray]
    oneOf: Optional[SchemaArray]
    not: Optional[JSONSchema]
"""Always valid if true. Never valid if false. Is constant.
"""
JSONSchemaBoolean = NewType("JSONSchemaBoolean", bool)

JSONSchema = NewType("JSONSchema", Union[JSONSchemaObject, JSONSchemaBoolean])
from typing import NewType

$Id = NewType("$Id", str)
from typing import NewType

$Schema = NewType("$Schema", str)
from typing import NewType

$Ref = NewType("$Ref", str)
from typing import NewType

$Comment = NewType("$Comment", str)
from typing import NewType

Title = NewType("Title", str)
from typing import NewType

Description = NewType("Description", str)
from typing import Any, NewType

AlwaysTrue = NewType("AlwaysTrue", Any)
from typing import NewType

ReadOnly = NewType("ReadOnly", bool)
from typing import List, NewType

Examples = NewType("Examples", List[AlwaysTrue])
from typing import NewType

MultipleOf = NewType("MultipleOf", float)
from typing import NewType

Maximum = NewType("Maximum", float)
from typing import NewType

ExclusiveMaximum = NewType("ExclusiveMaximum", float)
from typing import NewType

Minimum = NewType("Minimum", float)
from typing import NewType

ExclusiveMinimum = NewType("ExclusiveMinimum", float)
from typing import NewType

NonNegativeInteger = NewType("NonNegativeInteger", int)
from typing import Any, NewType

DefaultZero = NewType("DefaultZero", Any)
from typing import NewType, Any, Mapping

NonNegativeIntegerDefaultZero = NewType("NonNegativeIntegerDefaultZero", Mapping[Any, Any])
from typing import NewType

Pattern = NewType("Pattern", str)
from typing import List, NewType

SchemaArray = NewType("SchemaArray", List[JSONSchema])
from typing import NewType, Union

Items = NewType("Items", Union[JSONSchema, SchemaArray])
from typing import NewType

UniqueItems = NewType("UniqueItems", bool)
from typing import NewType

StringDoaGddGA = NewType("StringDoaGddGA", str)
from typing import List, NewType

StringArray = NewType("StringArray", List[StringDoaGddGA])
from typing import NewType, Any, Mapping

Definitions = NewType("Definitions", Mapping[Any, Any])
from typing import NewType, Any, Mapping

Properties = NewType("Properties", Mapping[Any, Any])
from typing import NewType, Any, Mapping

PatternProperties = NewType("PatternProperties", Mapping[Any, Any])
from typing import NewType, Union

DependenciesSet = NewType("DependenciesSet", Union[JSONSchema, StringArray])
from typing import NewType, Any, Mapping

Dependencies = NewType("Dependencies", Mapping[Any, Any])
from typing import List, NewType

Enum = NewType("Enum", List[AlwaysTrue])
from typing import Any, NewType

SimpleTypes = NewType("SimpleTypes", Any)
from typing import List, NewType

ArrayOfSimpleTypes = NewType("ArrayOfSimpleTypes", List[SimpleTypes])
from typing import NewType, Union

Type = NewType("Type", Union[SimpleTypes, ArrayOfSimpleTypes])
from typing import NewType

Format = NewType("Format", str)
from typing import NewType

ContentMediaType = NewType("ContentMediaType", str)
from typing import NewType

ContentEncoding = NewType("ContentEncoding", str)
from typing import TypedDict, Optional

class JSONSchemaObject(TypedDict):
    $id: Optional[$Id]
    $schema: Optional[$Schema]
    $ref: Optional[$Ref]
    $comment: Optional[$Comment]
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
from typing import NewType
"""Always valid if true. Never valid if false. Is constant.
"""
JSONSchemaBoolean = NewType("JSONSchemaBoolean", bool)
from typing import NewType, Union

JSONSchema = NewType("JSONSchema", Union[JSONSchemaObject, JSONSchemaBoolean])
export declare const jsonSchema: {
    $schema: string;
    $id: string;
    title: string;
    default: {};
    oneOf: {
        $ref: string;
    }[];
    definitions: {
        JSONSchemaBoolean: {
            title: string;
            description: string;
            type: string;
        };
        JSONSchemaObject: {
            title: string;
            type: string;
            properties: {
                $id: {
                    title: string;
                    type: string;
                    format: string;
                };
                $schema: {
                    title: string;
                    type: string;
                    format: string;
                };
                $ref: {
                    title: string;
                    type: string;
                    format: string;
                };
                $comment: {
                    title: string;
                    type: string;
                };
                title: {
                    title: string;
                    type: string;
                };
                description: {
                    title: string;
                    type: string;
                };
                default: boolean;
                readOnly: {
                    title: string;
                    type: string;
                    default: boolean;
                };
                examples: {
                    title: string;
                    type: string;
                    items: boolean;
                };
                multipleOf: {
                    title: string;
                    type: string;
                    exclusiveMinimum: number;
                };
                maximum: {
                    title: string;
                    type: string;
                };
                exclusiveMaximum: {
                    title: string;
                    type: string;
                };
                minimum: {
                    title: string;
                    type: string;
                };
                exclusiveMinimum: {
                    title: string;
                    type: string;
                };
                maxLength: {
                    $ref: string;
                };
                minLength: {
                    $ref: string;
                };
                pattern: {
                    title: string;
                    type: string;
                    format: string;
                };
                additionalItems: {
                    $ref: string;
                };
                items: {
                    title: string;
                    anyOf: {
                        $ref: string;
                    }[];
                    default: boolean;
                };
                maxItems: {
                    $ref: string;
                };
                minItems: {
                    $ref: string;
                };
                uniqueItems: {
                    title: string;
                    type: string;
                    default: boolean;
                };
                contains: {
                    $ref: string;
                };
                maxProperties: {
                    $ref: string;
                };
                minProperties: {
                    $ref: string;
                };
                required: {
                    $ref: string;
                };
                additionalProperties: {
                    $ref: string;
                };
                definitions: {
                    title: string;
                    type: string;
                    additionalProperties: {
                        $ref: string;
                    };
                    default: {};
                };
                properties: {
                    title: string;
                    type: string;
                    additionalProperties: {
                        $ref: string;
                    };
                    default: {};
                };
                patternProperties: {
                    title: string;
                    type: string;
                    additionalProperties: {
                        $ref: string;
                    };
                    propertyNames: {
                        title: string;
                        format: string;
                    };
                    default: {};
                };
                dependencies: {
                    title: string;
                    type: string;
                    additionalProperties: {
                        title: string;
                        anyOf: {
                            $ref: string;
                        }[];
                    };
                };
                propertyNames: {
                    $ref: string;
                };
                const: boolean;
                enum: {
                    title: string;
                    type: string;
                    items: boolean;
                    minItems: number;
                    uniqueItems: boolean;
                };
                type: {
                    title: string;
                    anyOf: ({
                        $ref: string;
                        title?: undefined;
                        type?: undefined;
                        items?: undefined;
                        minItems?: undefined;
                        uniqueItems?: undefined;
                    } | {
                        title: string;
                        type: string;
                        items: {
                            $ref: string;
                        };
                        minItems: number;
                        uniqueItems: boolean;
                        $ref?: undefined;
                    })[];
                };
                format: {
                    title: string;
                    type: string;
                };
                contentMediaType: {
                    title: string;
                    type: string;
                };
                contentEncoding: {
                    title: string;
                    type: string;
                };
                if: {
                    $ref: string;
                };
                then: {
                    $ref: string;
                };
                else: {
                    $ref: string;
                };
                allOf: {
                    $ref: string;
                };
                anyOf: {
                    $ref: string;
                };
                oneOf: {
                    $ref: string;
                };
                not: {
                    $ref: string;
                };
            };
        };
        schemaArray: {
            title: string;
            type: string;
            minItems: number;
            items: {
                $ref: string;
            };
        };
        nonNegativeInteger: {
            title: string;
            type: string;
            minimum: number;
        };
        nonNegativeIntegerDefault0: {
            title: string;
            type: string;
            minimum: number;
            default: number;
        };
        simpleTypes: {
            title: string;
            type: string;
            enum: string[];
        };
        stringArray: {
            title: string;
            type: string;
            items: {
                type: string;
            };
            uniqueItems: boolean;
            default: never[];
        };
    };
};
export default jsonSchema;

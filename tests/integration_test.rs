extern crate json_schema;

use json_schema::*;

#[test]
fn can_build_and_serialize() {
    let schema = JSONSchemaObjectBuilder::default()
        .title("foobar".to_string())
        ._type(Type::SimpleTypes(SimpleTypes::String))
        .build()
        .unwrap();

    let as_str = serde_json::to_string(&schema).unwrap();
    let expected = "{\"title\": \"foobar\", \"type\": \"string\"}".to_string();
    assert_eq!(as_str, expected);
}

#[test]
fn can_build_and_serialize_array_types() {

    let schema = JSONSchemaObjectBuilder::default()
        ._type(Type::ArrayOfSimpleTypes(vec!(SimpleTypes::String, SimpleTypes::Array)))
        .build()
        .unwrap();

    let as_str = serde_json::to_string(&schema).unwrap();
    println!("{}", as_str);

    let expected = "{\"type\": [\"string\", \"array\"]}".to_string();
    assert_eq!(as_str, expected);
}

#[test]
fn can_deserialize() {
    let foo = r#"{
            "title": "helloworld",
            "type": "string"
        }"#;

    let as_json_schema: JSONSchemaObject = serde_json::from_str(foo).unwrap();
    assert_eq!(as_json_schema.title.unwrap(), "helloworld");
    assert_eq!(as_json_schema._type.unwrap(), Type::SimpleTypes(SimpleTypes::String));
}

#[test]
fn can_deserialize_with_array_type() {
    let foo = r#"{
            "title": "helloworld",
            "type": ["string", "array"]
        }"#;

    let as_json_schema: JSONSchemaObject = serde_json::from_str(&foo).unwrap();

    let title = as_json_schema.title.as_ref();
    assert_eq!(title.unwrap(), "helloworld");
    let types_vec: ArrayOfSimpleTypes = vec!(SimpleTypes::String, SimpleTypes::Array);
    let t = as_json_schema._type.as_ref();
    assert_eq!(t.unwrap(), &Type::ArrayOfSimpleTypes(types_vec));

    let back_to_str = serde_json::to_string(&as_json_schema);
    assert_eq!(foo.replace(" ", "").replace("\n", ""), back_to_str.unwrap());
}

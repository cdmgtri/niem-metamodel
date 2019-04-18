A metamodel for NIEM.

# Terminology:

Primarily uses terms from RDFS and OWL.

- Model
    - an entire data model, profile, EIEM, or release.
- ObjectProperty
- Class - maps to XSD complex types
    - from RDFS
- Datatype
    - from rdfs:Datatype
    - maps to XSD simple types
- DataProperty
- SubClassOf
- SubPropertyOf

# Order

Consistently use this order:

1. Namespace
2. ObjectProperty
3. Class
4. DataProperty
5. Datatype

# Class content style

Each class needs to identify its content style as one of the following:
- HasValue
- HasObjectProperty

This is self-evident given
1. a reference to a base type which identifies its content style, and
2. extension content (has-value has-object-property)

# Versioning

- Later: 
    - include a "Release" object, that identifies a set of namespaces.
    - include versioning info, identifying relationships between versions of components
    - include some kind of object that represents the concept of a namespace across multiple versions (e.g., the Justice domain /in general/).
    
    
    


Constraning facets: <https://www.w3.org/TR/xmlschema-2/#rf-facets>

List & Union: <https://www.w3.org/TR/xmlschema-2/#atomic-vs-list>


Christina's perspectives
- "accessors" to return different "slices" of the data
- 
- release
    - need to handle releases
        - a release is a collection of namespaces
        - "multiple versions of a namespace"
    - namespace as a new version of another namespace
    - component being a new version of another compoennt
    - can we look at a separate layer of release
    - "a model" versus "each iepd as its own model"
        - each could have their own releases
    - each namespace has a version attribute
- "namespace version"
- certain things optional vs required
    - schema generator
    - adapter
    - augmentation
    - metadata

# TODO

- there's no way to wantlist "an element in a type" or "an attribute in a type".
    - at this point, a reference to a type is just to the whole type.
- Write something that generates a regular wantlist from the metamodel.


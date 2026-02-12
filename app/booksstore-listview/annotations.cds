using BookstoreService as service from '../../srv/service';
annotate service.Books with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Gener',
                Value : gener,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Published On',
                Value : publishedOn,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Pages',
                Value : pages,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Price',
                Value : price,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Spec Information',
            ID : 'SpecInformation',
            Target : '@UI.FieldGroup#SpecInformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Chapters',
            ID : 'Chapters',
            Target : 'Chapters/@UI.LineItem#Chapters',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Title',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Gener',
            Value : gener,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Published On',
            Value : publishedOn,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Pages',
            Value : pages,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Price',
            Value : price,
        },
    ],
    UI.SelectionFields : [
        ID,
        pages,
    ],
    UI.HeaderInfo : {
        TypeName : 'Book',
        TypeNamePlural : 'Books',
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : gener,
        },
        TypeImageUrl : 'sap-icon://batch-payments',
    },
    UI.FieldGroup #SpecInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedAt,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedBy,
            },
            {
                $Type : 'UI.DataField',
                Value : Chapters.book.publishedOn,
                Label : 'publishedOn',
            },
        ],
    },
);

annotate service.Books with {
    author @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Authors',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : author_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
        ],
    }
};

annotate service.Books with {
    ID @Common.Label : 'ID'
};

annotate service.Books with {
    pages @Common.Label : 'Pages'
};

annotate service.Chapters with @(
    UI.LineItem #Chapters : [
        {
            $Type : 'UI.DataField',
            Value : book.Chapters.book_ID,
            Label : 'book_ID',
        },
        {
            $Type : 'UI.DataField',
            Value : book.Chapters.number,
            Label : 'number',
        },
        {
            $Type : 'UI.DataField',
            Value : book.Chapters.pages,
            Label : 'pages',
        },
        {
            $Type : 'UI.DataField',
            Value : book.Chapters.title,
            Label : 'title',
        },
    ]
);


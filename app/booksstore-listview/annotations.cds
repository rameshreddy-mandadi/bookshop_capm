using BookstoreService as service from '../../srv/service';
using from '@sap/cds/common';

annotate service.Books with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : title,
                Label : 'Title',
            },
            {
                $Type : 'UI.DataField',
                Label : 'Published On',
                Value : publishedOn,
            },
            {
                $Type : 'UI.DataField',
                Value : gener_code,
                Label : 'Gener',
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
            {
                $Type : 'UI.DataField',
                Value : stock,
                Label : 'Stock',
            },
            {
                $Type : 'UI.DataField',
                Value : status_code,
            },
            {
                $Type : 'UI.DataField',
                Value : currency_code,
                Label : 'Currency',
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
            Label : 'Title',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Gener',
            Value : gener_code,
        },
        {
            $Type : 'UI.DataField',
            Value : status_code,
            Label : 'StatusCode',
            Criticality : status.criticality,
            CriticalityRepresentation : #WithIcon,
        },
        {
            $Type : 'UI.DataField',
            Value : stock,
            Label : 'Stock',
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
        status_code,
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
            Value : gener_code,
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
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Header',
            ID : 'Header',
            Target : '@UI.FieldGroup#Header',
        },
    ],
    UI.FieldGroup #Header : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : status_code,
                Criticality : status.criticality,
                Label : 'Status',
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

annotate service.Books with {
    status @(
        Common.Text : status.displayText,
        Common.Text.@UI.TextArrangement : #TextOnly,
        Common.Label : 'StatusCode',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'BookStatus',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : status_code,
                    ValueListProperty : 'code',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
        Common.ExternalID : status.displayText,
    )
};

annotate service.BookStatus with {
    code @(
        Common.Text : displayText,
        Common.Text.@UI.TextArrangement : #TextOnly,
)};

annotate service.Books with {
    currency @Common.ValueListWithFixedValues : true
};

annotate service.Currencies with {
    code @Common.Text : symbol
};

annotate service.Books with {
    gener @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'GenersVH',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : gener_code,
                    ValueListProperty : 'description',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
        Common.ExternalID : gener.code,
)};


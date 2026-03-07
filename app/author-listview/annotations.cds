using BookstoreService as service from '../../srv/service';
annotate service.Authors with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'eBook',
            ID : 'eBook',
            Target : '@UI.FieldGroup#eBook',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Books Information',
            ID : 'BooksInformation',
            Target : '@UI.FieldGroup#BooksInformation',
        },
    ],
    UI.FieldGroup #eBook : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : content,
                Label : 'eBook file',
            },
        ],
    },
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : name,
            Label : 'Name',
        },
    ],
    UI.FieldGroup #BooksInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : bookCount,
                Label : 'Book Count',
            },
        ],
    },
);


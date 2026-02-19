using {
    cuid,
    managed,
    sap.common.Currencies
} from '@sap/cds/common';

namespace tutorial.db;

entity Books : cuid, managed {
    title       : String;
    author      : Association to Authors;
    gener       : Association to Geners;
    publishedOn : Date;
    pages       : Integer;
    price       : Decimal(9, 2);
    currency    : Association to Currencies;
    stock       : Integer;
    status      : Association to BookStatus;
    Chapters    : Composition of many Chapters
                      on Chapters.book = $self;
}

entity Geners {
    key code        : String;
        description : String;
}

type gener : String enum{
    Fiction = 'Fiction';
    Science = 'Science';
    Cooking = 'Cooking';
    Fantasy = 'Fantasy';
    Hobby = 'Hobby';
    Adventure = 'Adventure';
    SelfHelp = 'Self-Help';
    Art = 'Art';
    Children = 'Children';
};

entity BookStatus {
    key code        : String(1) enum {
            Available = 'A';
            Low_stock = 'L';
            Unavailable = 'U';
        }
        criticality : Integer;
        displayText : String;
}

entity Authors : cuid, managed {

    name  : String;
    books : Association to many Books
                on books.author = $self;
}

entity Chapters : cuid, managed {
    key book   : Association to Books;
        number : Integer;
        title  : String;
        pages  : Integer;

}

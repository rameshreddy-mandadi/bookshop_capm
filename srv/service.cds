using {tutorial.db as db} from '../db/schema';

service BookstoreService {
    entity Books      as projection on db.Books
        actions {
            @(Common.SideEffects: {TargetProperties: ['stock']})
            action addStock();
            action changePublishDate(newDate: Date);
            @(Common.SideEffects: {TargetProperties: ['status_code']})
            action changeStatus( @(common: {
                                     ValueListWithFixedValues: true,
                                     Label                   : 'New Status',
                                     ValueList               : {
                                         $Type         : 'Common.ValueListType',
                                         CollectionPath: 'BookStatus',
                                         Parameters    : [{
                                             $Type            : 'Common.ValueListParameterInOut',
                                             LocalDataProperty: status_code,
                                             ValueListProperty: 'code',
                                         }, ],
                                     },
                                 }) newStatus: String)
        };

    @(Common.SideEffects: {TargetEntities: ['/BookstoreService.EntityContainer/Books']})
    action addDiscount();

    entity Authors    as projection on db.Authors;
    entity Chapters   as projection on db.Chapters;
    entity BookStatus as projection on db.BookStatus;
    entity GenersVH   as projection on db.Geners;
}

annotate BookstoreService.Books with @odata.draft.enabled;

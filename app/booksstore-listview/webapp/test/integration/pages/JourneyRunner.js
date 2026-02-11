sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"booksstorelistview/test/integration/pages/BooksList",
	"booksstorelistview/test/integration/pages/BooksObjectPage"
], function (JourneyRunner, BooksList, BooksObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('booksstorelistview') + '/test/flpSandbox.html#booksstorelistview-tile',
        pages: {
			onTheBooksList: BooksList,
			onTheBooksObjectPage: BooksObjectPage
        },
        async: true
    });

    return runner;
});


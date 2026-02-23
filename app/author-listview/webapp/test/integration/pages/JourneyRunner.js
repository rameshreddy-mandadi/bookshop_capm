sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"authorlistview/test/integration/pages/AuthorsList",
	"authorlistview/test/integration/pages/AuthorsObjectPage"
], function (JourneyRunner, AuthorsList, AuthorsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('authorlistview') + '/test/flp.html#app-preview',
        pages: {
			onTheAuthorsList: AuthorsList,
			onTheAuthorsObjectPage: AuthorsObjectPage
        },
        async: true
    });

    return runner;
});


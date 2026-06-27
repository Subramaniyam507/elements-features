sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/subbu/testmodule/test/integration/pages/RootEntitiesList",
	"com/subbu/testmodule/test/integration/pages/RootEntitiesObjectPage",
	"com/subbu/testmodule/test/integration/pages/ChildEntities1ObjectPage"
], function (JourneyRunner, RootEntitiesList, RootEntitiesObjectPage, ChildEntities1ObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/subbu/testmodule') + '/test/flp.html#app-preview',
        pages: {
			onTheRootEntitiesList: RootEntitiesList,
			onTheRootEntitiesObjectPage: RootEntitiesObjectPage,
			onTheChildEntities1ObjectPage: ChildEntities1ObjectPage
        },
        async: true
    });

    return runner;
});


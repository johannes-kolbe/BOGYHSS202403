sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'lrop/test/integration/FirstJourney',
		'lrop/test/integration/pages/LehrerList',
		'lrop/test/integration/pages/LehrerObjectPage'
    ],
    function(JourneyRunner, opaJourney, LehrerList, LehrerObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('lrop') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheLehrerList: LehrerList,
					onTheLehrerObjectPage: LehrerObjectPage
                }
            },
            opaJourney.run
        );
    }
);
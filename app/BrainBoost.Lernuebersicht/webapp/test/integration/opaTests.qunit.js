sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'BrainBoost/Lernuebersicht/test/integration/FirstJourney',
		'BrainBoost/Lernuebersicht/test/integration/pages/FachList',
		'BrainBoost/Lernuebersicht/test/integration/pages/FachObjectPage'
    ],
    function(JourneyRunner, opaJourney, FachList, FachObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('BrainBoost/Lernuebersicht') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheFachList: FachList,
					onTheFachObjectPage: FachObjectPage
                }
            },
            opaJourney.run
        );
    }
);
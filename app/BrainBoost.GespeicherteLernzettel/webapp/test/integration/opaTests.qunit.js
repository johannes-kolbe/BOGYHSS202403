sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'BrainBoost/GespeicherteLernzettel/test/integration/FirstJourney',
		'BrainBoost/GespeicherteLernzettel/test/integration/pages/LernstoffList',
		'BrainBoost/GespeicherteLernzettel/test/integration/pages/LernstoffObjectPage'
    ],
    function(JourneyRunner, opaJourney, LernstoffList, LernstoffObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('BrainBoost/GespeicherteLernzettel') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheLernstoffList: LernstoffList,
					onTheLernstoffObjectPage: LernstoffObjectPage
                }
            },
            opaJourney.run
        );
    }
);
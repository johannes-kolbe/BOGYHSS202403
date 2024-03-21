using BrainBoostService as service from '../../srv/service';

annotate service.Fach with @UI : {
     HeaderInfo #Card : {
        $Type : 'UI.HeaderInfoType',
        TypeName : 'Fach',
        TypeNamePlural : 'Fächer',
        ImageUrl : Icon
    },
    LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Name',
            Value : Name,
        },
        {
            $Type : 'UI.DataFieldForIntentBasedNavigation',
            SemanticObject : 'BrainBoostLernuebersicht',
            Action : 'display',
            Label : 'Show Fächer',
            Mapping : [
                {
                    $Type : 'Common.SemanticObjectMappingType',
                    LocalProperty : ID,
                    SemanticObjectProperty : 'fach.ID',
                },
            ],
        },
        {
            $Type : 'UI.DataFieldForIntentBasedNavigation',
            SemanticObject : 'BrainBoostGespeicherteLernzett',
            Action : 'display',
            Label : 'Show Lernstoff',
            Mapping : [
                {
                    $Type : 'Common.SemanticObjectMappingType',
                    LocalProperty : ID,
                    SemanticObjectProperty : 'lernstoff.ID',
                },
            ],
        },
    ]
};
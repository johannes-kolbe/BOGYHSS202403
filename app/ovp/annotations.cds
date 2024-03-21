using BrainBoostService as service from '../../srv/service';

annotate service.Fach with @UI : { 
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
    ]
 };

using BrainBoostService as service from '../../srv/service';

annotate service.Fach.Icon with @UI.IsImageURL: true;

annotate service.Fach with @UI: {
    HeaderInfo #Card   : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Fach',
        TypeNamePlural: 'Fächer',
        ImageUrl      : Icon
    },
    LineItem #OVP      : [
        {
            $Type  : 'UI.DataField',
            IconUrl: Icon,
            Value  : Name,
        },
        {
            $Type         : 'UI.DataFieldForIntentBasedNavigation',
            SemanticObject: 'BrainBoostLernuebersicht',
            Action        : 'display',
            Label         : 'Show Fächer',
            Mapping       : [{
                $Type                 : 'Common.SemanticObjectMappingType',
                LocalProperty         : Name,
                SemanticObjectProperty: 'Fach',

            }],

        },
    ],
    Identification #OVP: [{
        $Type: 'UI.DataField',
        Value: ID,
        Label: 'Fach',
    }, ],
};

annotate service.Gespeichert with @UI: {
    LineItem #OVP      : [
        {
            $Type            : 'UI.DataField',
            Value            : lernstoff.Titel,
            Label            : 'Titel',
            ![@UI.Importance]: #High,
        },
        {
            $Type            : 'UI.DataField',
            Value            : lernstoff.Beschreibung,
            Label            : 'Beschreibung',
            ![@UI.Importance]: #Low,
        },
        {
            $Type            : 'UI.DataField',
            Value            : lernstoff.stufe_ID,
            Label            : 'Stufe',
            ![@UI.Importance]: #Medium,
        },
        {
            $Type         : 'UI.DataFieldForIntentBasedNavigation',
            SemanticObject: 'BrainBoostGespeicherteLernzett',
            Action        : 'display',
            Label         : 'Show Lernstoff',
        },
    ],
    Identification #OVP: [{
        $Type: 'UI.DataField',
        Value: ID,
        Label: 'Fach',
    }, ],
};

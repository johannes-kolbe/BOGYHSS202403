using BrainBoostService as service from '../../srv/service';

annotate service.Fach with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Name',
            Value : Name,
        },
    ]
);
annotate service.Fach with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Name',
                Value : Name,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Lernuebersicht',
            ID : 'Lernuebersicht',
            Target : 'lernstoff/@UI.LineItem#Lernuebersicht',
        },
    ]
);
annotate service.Lernstoff with @(
    UI.LineItem #Lernuebersicht : [
        {
            $Type : 'UI.DataField',
            Value : autor_ID,
            Label : 'autor_ID',
        },]
);

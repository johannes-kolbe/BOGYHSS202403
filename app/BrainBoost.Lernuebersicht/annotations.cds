using BrainBoostService as service from '../../srv/service';

annotate service.Fach with @(
    UI.LineItem : [
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
);

annotate service.Fach with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Fach',
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
            Label : 'Autor',
            ![@UI.Importance] : #Low,
        },
        {
            $Type : 'UI.DataField',
            Value : Titel,
            Label : 'Titel',
            ![@UI.Importance] : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : Data,
            Label : 'Datei',
            ![@UI.Importance] : #Low,
        },
        {
            $Type : 'UI.DataField',
            Value : Beschreibung,
            Label : 'Beschreibung',
            ![@UI.Importance] : #High,
        },]
);
annotate service.Lernstoff with {
    autor @Common.Text : {
            $value : autor.Nutzername,
            ![@UI.TextArrangement] : #TextOnly,
        }
};
annotate service.Lernstoff with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Themen',
            ID : 'Themen',
            Target : '@UI.FieldGroup#Themen',
        },
    ],
    UI.FieldGroup #Lernstoff : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : Titel,
                Label : 'Titel',
            },
            {
                $Type : 'UI.DataField',
                Value : Beschreibung,
                Label : 'Beschreibung',
            },
            {
                $Type : 'UI.DataField',
                Value : thema.lernstoff.Data,
                Label : 'Data',
            },],
    }
);
annotate service.Lernstoff with @(
    UI.SelectionFields : [
        fach.ID,]
);
annotate service.Fach with {
    Name @Common.Label : 'Name'
};
annotate service.Fach with {
    ID @Common.Label : 'Fach'
};
annotate service.Fach with {
    ID @Common.Text : {
            $value : Name,
            ![@UI.TextArrangement] : #TextOnly,
        }
};
annotate service.Fach with {
    ID @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Fach',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : ID,
                    ValueListProperty : 'ID',
                },
            ],
            Label : 'Fach',
        },
        Common.ValueListWithFixedValues : true
)};
annotate service.Lernstoff with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : thema_ID,
            Label : 'Thema',
        },]
);
annotate service.Lernstoff with @(
    UI.FieldGroup #Themen : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : thema_ID,
                Label : 'thema_ID',
            },],
    }
);
annotate service.Lernstoff with {
    thema @Common.Text : {
            $value : thema.Name,
            ![@UI.TextArrangement] : #TextOnly,
        }
};

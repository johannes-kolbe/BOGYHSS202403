using BrainBoostService as service from '../../srv/service';

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
            Label : 'Lernstoff',
            ID : 'Lernstoff',
            Target : '@UI.FieldGroup#Lernstoff1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Links',
            ID : 'links2',
            Target : 'links/@UI.LineItem#links1',
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
annotate service.Lernstoff with @(
    UI.FieldGroup #Lernstoff1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : Titel,
                Label : 'Titel',
            },
            {
                $Type : 'UI.DataField',
                Value : Datum,
                Label : 'Datum',
            },
            {
                $Type : 'UI.DataField',
                Value : Beschreibung,
                Label : 'Beschreibung',
            },
            {
                $Type : 'UI.DataField',
                Value : autor_ID,
                Label : 'Autor',
            },
            {
                $Type : 'UI.DataField',
                Value : lehrer_ID,
                Label : 'Lehrer',
            },],
    }
);
annotate service.Thema with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : lernstoff.thema_ID,
            Label : 'Thema',
        },
    ]
);
annotate service.Thema with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Lernstoff',
            ID : 'Lernstoff',
            Target : 'lernstoff/@UI.LineItem#Lernstoff',
        },
    ]
);
annotate service.Lernstoff with @(
    UI.LineItem #Lernstoff : [
        {
            $Type : 'UI.DataField',
            Value : Titel,
            Label : 'Titel',
            ![@UI.Importance] : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : Beschreibung,
            Label : 'Beschreibung',
            ![@UI.Importance] : #Low,
        },
        {
            $Type : 'UI.DataField',
            Value : stufe_ID,
            Label : 'Stufe',
            ![@UI.Importance] : #Medium,
        },]
);
annotate service.Thema with @(
    UI.SelectionFields : [
        fach.ID,
        lernstoff.thema_ID,]
);
annotate service.Lernstoff with {
    thema @Common.Label : 'Thema'
};
annotate service.Thema with @(
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Thema',
            ID : 'Thema',
            Target : '@UI.FieldGroup#Thema1',
        },],
    UI.FieldGroup #Thema : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : lernstoff.thema_ID,
                Label : 'Thema',
                ![@UI.Hidden],
            },],
    }
);
annotate service.Lernstoff with {
    stufe @Common.Text : {
            $value : stufe.Name,
            ![@UI.TextArrangement] : #TextOnly,
        }
};
annotate service.Lernstoff with {
    thema @Common.Text : {
            $value : thema.Name,
            ![@UI.TextArrangement] : #TextOnly,
        }
};
annotate service.Thema with {
    Name @Common.Label : 'Name'
};
annotate BrainBoost.Links with @(
    UI.LineItem #links : [
    ]
);
annotate service.Links with @(
    UI.LineItem #links1 : [
        {
            $Type : 'UI.DataField',
            Value : lernstoff.links.Titel,
            Label : 'Titel',
        },
        {
            $Type : 'UI.DataField',
            Value : lernstoff.links.URL,
            Label : 'URL',
        },]
);
annotate service.Thema with @(
    UI.FieldGroup #Thema1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : lernstoff.thema_ID,
            },],
    }
);
annotate service.Lernstoff with {
    lehrer @Common.Text : {
            $value : lehrer.Name,
            ![@UI.TextArrangement] : #TextOnly,
        }
};

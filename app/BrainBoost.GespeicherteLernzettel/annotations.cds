using BrainBoostService as service from '../../srv/service';

annotate service.Lernstoff with {
    autor @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Nutzer',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : autor_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Vorname',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Nutzername',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Beitrittsdatum',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Gmail',
            },
        ],
    }
};
annotate service.Lernstoff with {
    niveau @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Niveau',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : niveau_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Name',
            },
        ],
    }
};
annotate service.Lernstoff with {
    fach @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Fach',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : fach_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Icon',
            },
        ],
    }
};
annotate service.Lernstoff with {
    art @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Art',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : art_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Name',
            },
        ],
    }
};
annotate service.Lernstoff with {
    lehrer @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Lehrer',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : lehrer_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Anrede',
            },
        ],
    }
};
annotate service.Lernstoff with {
    stufe @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Stufe',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : stufe_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Name',
            },
        ],
    }
};
annotate service.Lernstoff with {
    thema @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Thema',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : thema_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Name',
            },
        ],
    }
};
annotate service.Gespeichert with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : lernstoff.Titel,
            Label : 'Titel',
            ![@UI.Importance] : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : lernstoff.Beschreibung,
            Label : 'Beschreibung',
            ![@UI.Importance] : #Low,
        },
        {
            $Type : 'UI.DataField',
            Value : lernstoff.stufe_ID,
            Label : 'Stufe',
            ![@UI.Importance] : #Medium,
        },
    ]
);
annotate service.Gespeichert with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Lernzettel',
            ID : 'Lernzettel',
            Target : '@UI.FieldGroup#Lernzettel',
        },
    ],
    UI.FieldGroup #Lernzettel : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : lernstoff.Titel,
                Label : 'Titel',
            },
            {
                $Type : 'UI.DataField',
                Value : lernstoff.Datum,
                Label : 'Datum',
            },{
                $Type : 'UI.DataField',
                Value : lernstoff.Beschreibung,
                Label : 'Beschreibung',
            },{
                $Type : 'UI.DataField',
                Value : lernstoff.autor_ID,
                Label : 'Autor',
            },],
    }
);
annotate service.Gespeichert with @(
    UI.SelectionFields : [
        lernstoff.fach_ID,
        lernstoff.thema_ID,
        nutzer.ID,
    ]
);
annotate service.Lernstoff with {
    fach @Common.Label : 'Fach'
};
annotate service.Nutzer with {
    ID @Common.Label : 'Nutzer'
};
annotate service.Nutzer with {
    ID @Common.Text : {
            $value : Nutzername,
            ![@UI.TextArrangement] : #TextOnly,
        }
};
annotate service.Nutzer with {
    ID @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Nutzer',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : ID,
                    ValueListProperty : 'ID',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};
/* annotate service.Lernstoff with @(
    UI.SelectionPresentationVariant #table : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
                {
                    $Type : 'UI.SelectOptionType',
                    PropertyName : thema.Name,
                },
            ],
        },
    }
); */

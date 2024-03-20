using BrainBoostService as service from '../../srv/service';


annotate service.Statistik with @UI: {
    Chart  : {
        $Type : 'UI.ChartDefinitionType',
        ChartType : #Bar,
    },
};

annotate service.Lehrer with @UI : { 
    DataPoint #Name : {
        $Type : 'UI.DataPointType',
        Value : Name,
        Title: 'Lehrer Name DataPoint',
        Description:'Lehrer DP Desc'
    },
    DataPoint #DP : {
        $Type : 'UI.DataPointType',
        MinimumValue : 1,
        MaximumValue : 5,
        Value: 2
    },
    LineItem  : [
        {
            $Type : 'UI.DataFieldWithIntentBasedNavigation',
            Value : Name,
            SemanticObject : 'lrop',
            Action : 'show',
        },
        {
            $Type : 'UI.DataField',
            Value : Name,
        },
    ],
    Identification  : [

        {
            $Type : 'UI.DataField',
            Value : Name,
        },
        {
            $Type : 'UI.DataFieldWithUrl',
            Value : 'Value',
            Url : '../../lrop/webapp/index.html',
        }
    ],
    SelectionVariant #SV : {
        $Type : 'UI.SelectionVariantType',
        Parameters : [
            {
                $Type : 'UI.Parameter',
                PropertyName : Name,
                PropertyValue : Name,
            },
        ],
    },
 };

annotate service.Fach with @UI : {  
    LineItem  : [
        {
            $Type : 'UI.DataField',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Value : Name,
        },
        {
            $Type : 'UI.DataFieldWithIntentBasedNavigation',
            Value : Name,
            SemanticObject : 'OVP_Fach',
        }
    ],
 };

 //annotate service.Fach with @Common.SemanticObject  : 'OVP_Fach';
 annotate service.Fach with {@Common.SemanticObject  : 'OVP_Fach' lehrer};
 


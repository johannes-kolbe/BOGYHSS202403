using BrainBoostService as service from '../../srv/service';

annotate service.Fach with @UI : { 
    Identification #OVP : [
        {
            $Type : 'UI.DataField',
            Value : Name,
        },
    ],
    LineItem #OVP : [
        {
            $Type : 'UI.DataField',
            Value : Name,
        },
    ],
 };

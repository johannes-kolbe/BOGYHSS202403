using { BrainBoost as my } from '../db/schema';

@path : '/service/BrainBoostSvcs'
service BrainBoostService
{
    entity Lehrer as
        projection on my.Lehrer;

    @odata.draft.enabled
    entity Fach as
        projection on my.Fach;
}

annotate BrainBoostService with @requires :
[
    'authenticated-user'
];

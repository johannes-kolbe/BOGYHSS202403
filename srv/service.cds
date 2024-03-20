using { BrainBoost as my } from '../db/schema';

@path : '/service/BrainBoostSvcs'
service BrainBoostService
{
    entity Lehrer as
        projection on my.Lehrer;

    entity Fach as
        projection on my.Fach;

    @odata.draft.enabled
    entity Statistik as
        projection on my.Statistik;
}

annotate BrainBoostService with @requires :
[
    'authenticated-user'
];

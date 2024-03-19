using { BrainBoost as my } from '../db/schema';

@path : '/service/BrainBoostSvcs'
service BrainBoostService
{
    entity Lehrer as
        projection on my.Lehrer;
}

annotate BrainBoostService with @requires :
[
    'authenticated-user'
];

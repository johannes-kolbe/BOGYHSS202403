using { BrainBoost as my } from '../db/schema';

@path : '/service/BrainBoostSvcs'
service BrainBoostService
{
    entity Lehrer as
        projection on my.Lehrer;

    @odata.draft.enabled
    entity Fach as
        projection on my.Fach;

    @odata.draft.enabled
    entity Art as
        projection on my.Art;

    @odata.draft.enabled
    entity Lernstoff as
        projection on my.Lernstoff;

    @odata.draft.enabled
    entity Likes as
        projection on my.Likes;

    @odata.draft.enabled
    entity Niveau as
        projection on my.Niveau;

    @odata.draft.enabled
    entity Nutzer as
        projection on my.Nutzer;

    @odata.draft.enabled
    entity Stufe as
        projection on my.Stufe;

    @odata.draft.enabled
    entity Thema as
        projection on my.Thema;
}

annotate BrainBoostService with @requires :
[
    'authenticated-user'
];

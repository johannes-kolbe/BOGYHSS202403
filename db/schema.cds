namespace BrainBoost;

using
{
    Country,
    Currency,
    Language,
    User,
    cuid,
    extensible,
    managed,
    temporal
}
from '@sap/cds/common';

entity Lehrer
{
    key ID : UUID;
    Name : String;
    Anrede : String;
}

entity Fach
{
    key ID : UUID;
    Name : String;
    thema : Association to many Thema on thema.fach = $self;
    
}

entity Stufe
{
    key ID : UUID;
    Name : String;
}

entity Art
{
    key ID : UUID;
    Name : String;
}

entity Lernstoff
{
    key ID : UUID;
    Datum : DateTime;
    Visible : Boolean;
    likes : Association to many Likes;
    autor : Association to one Nutzer on autor.lernstoff = $self;
    gespeichert : Association to one Gespeichert;
}

entity Thema
{
    key ID : UUID;
    Name : String;
    fach : Association to one Fach;
}

entity Niveau
{
    key ID : UUID;
    Name : String not null;
}

entity Nutzer
{
    key ID : UUID;
    Vorname : String(100);
    Nutzername : String(100);
    Beitrittsdatum : DateTime;
    Stufe : String(100);
    Gmail : String(100);
    Gespeichert : String(100);
    lernstoff : Association to many Lernstoff;
    likes : Association to many Likes;
    gespeichert : Association to many Gespeichert;
}

entity Entity1
{
    key ID : UUID;
}

entity Likes
{
    key ID : UUID;
    Bewertung : Integer;
    lernstoff : Association to one Lernstoff on lernstoff.likes = $self;
    nutzer : Association to one Nutzer on nutzer.likes = $self;
}

entity Gespeichert
{
    key ID : UUID;
    lernstoff : Association to one Lernstoff on lernstoff.gespeichert = $self;
    nutzer : Association to one Nutzer on nutzer.gespeichert = $self;
}

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
    thema : Association to one Thema;
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
    likes : Association to one Likes;
    autor : Association to one Nutzer on autor.lernstoff = $self;
}

entity Thema
{
    key ID : UUID;
    Name : String;
    fach : Association to many Fach on fach.thema = $self;
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
    lernstoff : Association to one Lernstoff;
    likes : Association to one Likes;
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

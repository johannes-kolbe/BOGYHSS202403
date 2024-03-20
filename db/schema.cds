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
    Anrede : String
}

entity Fach
{
    key ID : UUID;
    Name: String;
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
    Autor : String;
    Visible : Boolean;
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
}

entity Entity1
{
    key ID : UUID;
}

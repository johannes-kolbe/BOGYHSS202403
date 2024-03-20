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
    likes : Association to many Likes on likes.lernstoff = $self;
    autor : Association to one Nutzer;
    gespeichert : Association to many Gespeichert on gespeichert.lernstoff = $self;
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
    Stufe : Association to one Stufe;
    Gmail : String(100);
    lernstoff : Association to many Lernstoff on lernstoff.autor = $self;
    likes : Association to one Likes on likes.nutzer = $self;
    gespeichert : Association to many Gespeichert on gespeichert.nutzer = $self;
}

entity Likes
{
    key ID : UUID;
    Bewertung : Integer;
    lernstoff : Association to one Lernstoff;
    nutzer : Association to one Nutzer;
}

entity Gespeichert
{
    key ID : UUID;
    lernstoff : Association to one Lernstoff;
    nutzer : Association to one Nutzer;
}

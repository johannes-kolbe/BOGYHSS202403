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
    lernstoff : Association to one Lernstoff;
}

entity Fach
{
    key ID : UUID;
    Name : String;
    thema : Association to many Thema on thema.fach = $self;
    lernstoff : Association to many Lernstoff on lernstoff.fach = $self;
}

entity Stufe
{
    key ID : UUID;
    Name : String;
    lernstoff : Association to one Lernstoff;
}

entity Art
{
    key ID : UUID;
    Name : String;
    lernstoff : Association to one Lernstoff;
}

entity Lernstoff
{
    key ID : UUID;
    Datum : DateTime;
    Visible : Boolean;
    likes : Association to many Likes on likes.lernstoff = $self;
    autor : Association to one Nutzer;
    gespeichert : Association to many Gespeichert on gespeichert.lernstoff = $self;
    Data : String;
    niveau : Association to one Niveau;
    fach : Association to one Fach;
    art : Association to one Art on art.lernstoff = $self;
    lehrer : Association to one Lehrer on lehrer.lernstoff = $self;
    stufe : Association to one Stufe on stufe.lernstoff = $self;
    thema : Association to one Thema on thema.lernstoff = $self;
}

entity Thema
{
    key ID : UUID;
    Name : String;
    fach : Association to one Fach;
    lernstoff : Association to one Lernstoff;
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

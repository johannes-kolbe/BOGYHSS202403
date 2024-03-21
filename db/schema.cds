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
    lernstoff : Association to one Lernstoff on lernstoff.lehrer = $self;
}

entity Fach
{
    key ID : UUID;
    Name : String;
    thema : Association to many Thema on thema.fach = $self;
    lernstoff : Association to many Lernstoff on lernstoff.fach = $self;
    Icon : String;
}

entity Stufe
{
    key ID : UUID;
    Name : String;
    lernstoff : Association to one Lernstoff on lernstoff.stufe = $self;
}

entity Art
{
    key ID : UUID;
    Name : String;
    lernstoff : Association to one Lernstoff on lernstoff.art = $self;
}

entity Lernstoff
{
    key ID : UUID;
    Datum : DateTime not null;
    Visible : Boolean not null;
    likes : Association to many Likes on likes.lernstoff = $self;
    autor : Association to one Nutzer;
    gespeichert : Association to many Gespeichert on gespeichert.lernstoff = $self;
    Data : String;
    niveau : Association to one Niveau;
    fach : Association to one Fach;
    art : Association to one Art;
    lehrer : Association to one Lehrer;
    stufe : Association to one Stufe;
    Titel : String not null;
    Beschreibung : String;
    thema : Association to one Thema;
    links : Association to many Links on links.lernstoff = $self;
}

entity Thema
{
    key ID : UUID;
    Name : String;
    fach : Association to one Fach;
    lernstoff : Association to many Lernstoff on lernstoff.thema = $self;
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

entity Links
{
    key ID : UUID;
    URL : String;
    Titel : String;
    lernstoff : Association to one Lernstoff;
}

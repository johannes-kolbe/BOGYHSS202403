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

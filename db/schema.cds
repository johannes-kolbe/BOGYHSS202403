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
    Name : String(100);
    Anrede : String(100);
}

entity Fach
{
    key ID : UUID;
    Thema : String;
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

entity Entity1
{
    key ID : UUID;
}

entity Nutzer
{
    key ID : UUID;
    Vorname : String;
    Beitrittsdatum : DateTime;
    Gmail : String(100);
}

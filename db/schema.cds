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
    Fach : Association to many Fach on Fach.lehrer = $self;
}

entity Fach
{
    key ID : UUID;
    Name : String(100);
    lehrer : Association to one Lehrer;
}

entity Statistik
{
    key ID : UUID;
    Day : Date;
    Hours : Decimal;
}

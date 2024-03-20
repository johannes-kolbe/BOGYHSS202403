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

entity Niveau
{
    key ID : UUID;
    Name : String not null;
}

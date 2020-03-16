
-- 1. COALESCE can be useful when you want to replace a NULL value with some other value. In this example you show the name of the party for each MSP that has a party. For the MSP with no party (such as Canavan, Dennis) you show the string None.

SELECT name, party
      ,COALESCE(party,'None') AS aff
  FROM msp WHERE name LIKE 'C%'
